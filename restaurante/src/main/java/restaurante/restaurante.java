package restaurante;

public class restaurante {
    private String nome;
    private String endereco;
    private String tipoDeCulinaria;
    private int rating;

    // Construtor
    public restaurante(String nome, String endereco, String tipoDeCulinaria, int rating) {
        this.nome = nome;
        this.endereco = endereco;
        this.tipoDeCulinaria = tipoDeCulinaria;
        this.rating = rating;
    }

    // Getters e Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTipoDeCulinaria() {
        return tipoDeCulinaria;
    }

    public void setTipoDeCulinaria(String tipoDeCulinaria) {
        this.tipoDeCulinaria = tipoDeCulinaria;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}
