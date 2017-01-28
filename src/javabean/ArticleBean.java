package javabean;


import control.CatalogueController;
import entity.articles.Article;
import exceptions.ArticleAlreadyPresentException;
import exceptions.IncompleteFormException;
import control.ArticleFactory;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;

public class ArticleBean implements Serializable  {

    private String nome = "";
    private String proprietario = "";
    private String prezzo = "";
    private String quantita = "";
    private String editore = "";
    private String autore = "";
    private String titolo = "";
    private String tipo = "";
    private String marca = "";
    private String taglia = "0";
    private String materia = "";
    private String edizione = "0";
    private String modello = "";
    private String tipoArticolo = "";
    private String radioB = "";
    private ArrayList<Article> lista;
    private String image = "";
    private Article article;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getProprietario() {
        return proprietario;
    }

    public void setProprietario(String proprietario) {
        this.proprietario = proprietario;
    }

    public String getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(String prezzo) {
        this.prezzo = prezzo;
    }

    public String getQuantita() {
        return quantita;
    }

    public void setQuantita(String quantita) {
        this.quantita = quantita;
    }

    public String getEditore() {
        return editore;
    }

    public void setEditore(String editore) {
        this.editore = editore;
    }

    public String getAutore() {
        return autore;
    }

    public void setAutore(String autore) {
        this.autore = autore;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getTaglia() {
        return taglia;
    }

    public void setTaglia(String taglia) {
        this.taglia = taglia;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String getEdizione() {
        return edizione;
    }

    public void setEdizione(String edizione) {
        this.edizione = edizione;
    }

    public String getModello() {
        return modello;
    }

    public void setModello(String modello) {
        this.modello = modello;
    }

    public String getTipoArticolo() {
        return tipoArticolo;
    }

    public void setTipoArticolo(String tipoArticolo) {
        this.tipoArticolo = tipoArticolo;
    }

    public String getRadioB() {
        return radioB;
    }

    public void setRadioB(String radioB) {
        this.radioB = radioB;
    }

    public ArrayList<Article> getLista() {
        return lista;
    }

    public void setLista(){

        System.out.println("valore del radio botton = " + radioB);
        if(radioB != null) {

            if (radioB.equals("inf")) {
                tipoArticolo = "Electronics";
            } else if (radioB.equals("cloth")) {
                tipoArticolo = "Clothing";
            } else if (radioB.equals("libri")) {
                tipoArticolo = "Book";
            } else if (radioB.equals("scolastico")) {
                tipoArticolo = "TextBook";
            }
            try {
                lista = CatalogueController.getInstance().createCatalogue(nome, proprietario, tipoArticolo, editore, autore, titolo, tipo, marca, Integer.parseInt(taglia), materia, Integer.parseInt(edizione), modello);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else
        {
            try {
                lista = CatalogueController.getInstance().createCatalogue(nome, "", "", "", "", "", "", "", 0, "", 0, "");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public String getImage() {
        return image;
    }

    private void setImage(String image) {
        this.image = image;
    }

    private void saveArticle()
    {
        article = ArticleFactory.getInstance().getArticle();

        article.setNome(this.nome);
        article.setPrezzo(Float.parseFloat(this.prezzo));
        article.setProprietario(this.proprietario);
        article.setQuantità(Integer.parseInt(this.quantita));

    }

    public int insert()
    {
        try {
            // Controllo sintattico
            System.out.println("controllo campi");
            if (this.nome.equals("") || this.prezzo.equals("") || this.quantita.equals(""))
            {
                throw new IncompleteFormException();
            }
            else {

                saveArticle();
                System.out.println("inserisco");
                if (CatalogueController.getInstance().checkArticle(nome, proprietario)) {

                    System.out.println("articolo non presente");
                    CatalogueController.getInstance().addArticle(article);
                    System.out.println("articolo inseritoooooooooooooooooo");

                    if(!(image.equals("")))
                    {
                        //devo ottenere il nome dell'immagine nel db
                        System.out.println("immagine presente");
                    }
                    if (!(radioB.equals(""))) {
                        if (radioB.equals("inf")) {
                            //ottieni un articolo di informatica dal factory e aggiungilo al db
                            System.out.println("informatica");
                        } else if (radioB.equals("cloth")) {
                            //vestiti
                            System.out.println("vestiti");
                        } else if (radioB.equals("libri")) {
                            //libri
                            System.out.println("libri");
                        } else if (radioB.equals("scolastico")) {
                            System.out.println("scolastico");

                        }
                    }
                    System.out.println("inserito articolo");
                    return 1;
                }
                else
                {
                    throw new ArticleAlreadyPresentException();
                }
            }
        }
        catch(IncompleteFormException e)
        {
            return 2;
        }
        catch (ArticleAlreadyPresentException e)
        {
            return 4;
        }
        catch (Exception e)
        {
            return 3;
        }

    }

/*    public void reset(){
        nome = "";
        proprietario = "";
        editore = "";
        autore = "";
        titolo = "";
        tipo = "";
        marca = "";
        taglia = "0";
        materia = "";
        edizione = "0";
        modello = "";
        tipoArticolo = "";
        radioB = "";
        lista = null;
        image = "";
    }*/
}




