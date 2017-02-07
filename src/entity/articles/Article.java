package entity.articles;

import entity.users.RegisteredUser;

/**
 * @author dandi
 */

public class Article {

    private String nome;
    private float prezzo;
    private RegisteredUser proprietario;
    private String image;
    private int quantità;


    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public float getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(float prezzo) {
        this.prezzo = prezzo;
    }

    public RegisteredUser getProprietario() {
        return proprietario;
    }

    public void setProprietario(RegisteredUser proprietario) {
        this.proprietario = proprietario;
    }

    public int getQuantità() {
        return quantità;
    }

    public void setQuantità(int quantità) {
        this.quantità = quantità;
    }

    public String getImage() {
        return image;
    }

    public void setImage(int image) {
        this.image = String.valueOf(image) + ".jpg";
    }
}
