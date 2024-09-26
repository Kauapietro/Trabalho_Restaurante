package restaurante;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class restauranteDao {

    // Método para adicionar restaurante
    public void adicionar(restaurante restaurante) {
        String sql = "INSERT INTO restaurante (nome, endereco, tipoDeCulinaria, rating) VALUES (?, ?, ?, ?)";

        try (Connection conn = conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, restaurante.getNome());
            stmt.setString(2, restaurante.getEndereco());
            stmt.setString(3, restaurante.getTipoDeCulinaria());
            stmt.setInt(4, restaurante.getRating());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Método para listar todos os restaurantes
    public List<restaurante> listar() {
        List<restaurante> restaurantes = new ArrayList<>();
        String sql = "SELECT * FROM restaurante";

        try (Connection conn = conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String nome = rs.getString("nome");
                String endereco = rs.getString("endereco");
                String tipoDeCulinaria = rs.getString("tipoDeCulinaria");
                int rating = rs.getInt("rating");

                restaurante restaurante = new restaurante(nome, endereco, tipoDeCulinaria, rating);
                restaurantes.add(restaurante);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return restaurantes;
    }

    // Método para excluir um restaurante
    public boolean excluir(String nome) {
        String sql = "DELETE FROM restaurante WHERE nome = ?";

        try (Connection conn = conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, nome);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Método para buscar um restaurante pelo nome (usado na edição)
    public restaurante buscarPorNome(String nome) {
        String sql = "SELECT * FROM restaurante WHERE nome = ?";

        try (Connection conn = conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, nome);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String endereco = rs.getString("endereco");
                    String tipoDeCulinaria = rs.getString("tipoDeCulinaria");
                    int rating = rs.getInt("rating");

                    return new restaurante(nome, endereco, tipoDeCulinaria, rating);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Método para editar um restaurante
    public void editar(String originalNome, restaurante restauranteEditado) {
        String sql = "UPDATE restaurante SET nome = ?, endereco = ?, tipoDeCulinaria = ?, rating = ? WHERE nome = ?";

        try (Connection conn = conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, restauranteEditado.getNome());
            stmt.setString(2, restauranteEditado.getEndereco());
            stmt.setString(3, restauranteEditado.getTipoDeCulinaria());
            stmt.setInt(4, restauranteEditado.getRating());
            stmt.setString(5, originalNome);

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
