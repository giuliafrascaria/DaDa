package javabean;


import control.*;
import entity.articles.*;
import entity.users.RegisteredUser;
import exceptions.ArticleAlreadyPresentException;
import exceptions.IncompleteFormException;

import javax.servlet.http.Part;
import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;

import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;

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
    private Part image;                             //serializzare in base 64 lato client e salvare nel database come long
    private String imageName = "";
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


    public Part getImage() {
        return image;
    }

    public void setImage(Part image) {
        this.image = image;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    private void saveArticle()
    {
        article = ArticleFactory.getInstance().getArticle();

        article.setNome(this.nome);
        article.setPrezzo(Float.parseFloat(this.prezzo));
        RegisteredUser ru = UserFactory.getInstance().createRegisteredUser();
        ru.setEmail(proprietario);
        article.setProprietario(ru);
        article.setQuantità(Integer.parseInt(this.quantita));

    }

    private void saveExtraData(Article article)
    {
        if(article.getClass().equals(Clothing.class))
        {
            ((Clothing) article).setTipo(tipo);
            ((Clothing) article).setMarca(marca);
            ((Clothing) article).setTaglia(Integer.parseInt(taglia));
        }
        else if(article.getClass().equals(Electronics.class))
        {
            ((Electronics) article).setMarca(marca);
            ((Electronics) article).setModello(modello);
            ((Electronics) article).setTipo(tipo);
        }
        else if(article.getClass().equals(Book.class))
        {
            ((Book) article).setAutore(autore);
            ((Book) article).setTitolo(titolo);
            ((Book) article).setEditore(editore);

        }
        if(article.getClass().equals(TextBook.class))
        {
            ((TextBook) article).setEdizione(Integer.parseInt(edizione));
            ((TextBook) article).setMateria(materia);

        }

        article.setNome(nome);
        RegisteredUser ru = UserFactory.getInstance().createRegisteredUser();
        ru.setEmail(proprietario);
        article.setProprietario(ru);
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
                if (DaDaSystem.getInstance().checkArticle(nome, proprietario)) {

                    System.out.println("articolo non presente");
                    DaDaSystem.getInstance().addArticle(article);
                    System.out.println("articolo inserito");

                    if(!(image == null))
                    {
                        //devo ottenere il nome dell'immagine nel db
                        System.out.println("immagine presente");
                        String imagename = DaDaSystem.getInstance().getImageName(nome, proprietario);
                        System.out.println("salverò immagine con nome " + image);

                        OutputStream out = null;
                        InputStream filecontent = null;


                        try {
                            out = new FileOutputStream(new File("/web/img/" + File.separator
                                    + imagename));
                            filecontent = image.getInputStream();

                            int read = 0;
                            final byte[] bytes = new byte[1024];

                            while ((read = filecontent.read(bytes)) != -1) {
                                out.write(bytes, 0, read);
                            }

                        } catch (FileNotFoundException fne) {

                            LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                                    new Object[]{fne.getMessage()});
                        } finally {
                            if (out != null) {
                                out.close();
                            }
                            if (filecontent != null) {
                                filecontent.close();
                            }
                        }
                    }
                    if (!(radioB.equals(""))) {
                        if (radioB.equals("inf")) {
                            //ottieni un articolo di informatica dal factory e aggiungilo al db
                            System.out.println("informatica");
                            Electronics electronics = ArticleFactory.getInstance().getElectronics();
                            saveExtraData(electronics);
                            DaDaSystem.getInstance().addElectronics(electronics);
                        } else if (radioB.equals("cloth")) {
                            //vestiti
                            System.out.println("vestiti");
                            Clothing clothing = ArticleFactory.getInstance().getClothing();
                            saveExtraData(clothing);
                            DaDaSystem.getInstance().addClothing(clothing);
                        } else if (radioB.equals("libri")) {
                            //libri
                            System.out.println("libri");
                            Book book = ArticleFactory.getInstance().getBook();
                            saveExtraData(book);
                            DaDaSystem.getInstance().addBook(book);
                        } else if (radioB.equals("scolastico")) {
                            System.out.println("scolastico");
                            TextBook textBook = ArticleFactory.getInstance().getTextBook();
                            saveExtraData(textBook);
                            DaDaSystem.getInstance().addTextBook(textBook);
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

    public void reset(){
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
    }
}




