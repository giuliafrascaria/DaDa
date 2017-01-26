package javabean;


import control.CatalogueController;
import entity.articles.Article;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;

public class ArticleBean implements Serializable  {

    private String nome = "";
    private String proprietario = "";
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
    private String radioB;
    private ArrayList<Article> lista;

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

        if(radioB != null) {
            System.out.println("valore del radio botton = " + radioB);
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


}
