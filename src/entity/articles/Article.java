package entity.articles;

import entity.users.RegisteredUser;

/**
 * @author dandi, v2devnull
 */

public class Article {

    private String nome;
    private float prezzo;
    private RegisteredUser proprietario;
    private String email;
    private String image;
    private Boolean isvalid;
    private int quantità;

    //public Article(String nome, float prezzo, int quantità, Boolean isvalid){}


    public Article(String nome, RegisteredUser proprietario, float prezzo, int quantità, Boolean isvalid, String image){
        this.nome = nome;
        this.proprietario = proprietario;
        this.prezzo = prezzo;
        this.quantità = quantità;
        this.isvalid = isvalid;
        this.image = image;
    }

    public Article() {

    }

    public String getNome() {
        return nome;
    }

    public void setValidation(Boolean isvalid){
        this.isvalid = isvalid;
    }

    public boolean getValidation(){
        return isvalid;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
