package restaurante;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexao {
    private static final String URL = "jdbc:mysql://localhost:3306/restaurante"; // Substitua com a URL do seu banco de dados
    private static final String USER = "root"; // Substitua com o seu usuário do banco de dados
    private static final String PASSWORD = "root"; // Substitua com sua senha do banco de dados

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Carrega o driver do MySQL
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Erro ao carregar o driver do banco de dados.", e);
        }
    }
}
