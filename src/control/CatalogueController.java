package control;

import entity.articles.*;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.*;

/**
 * @author dandi
 * <p>
 * Questa classe è stata sviluppata come un Singleton.
 * <p>
 */

public class CatalogueController {
    //Singleton
    private static CatalogueController instance = new CatalogueController();
    private ArrayList<Article> articoli;

    private CatalogueController() {
    }

    public static CatalogueController getInstance(){
        return instance;
    }

    /*-------------------------------------------------------------------------------------------------------
    * È la funzione chiamata dalla boundary.                                                                  |
    * Si occupa della elaborazione dei dati immessi                                                           |
    * dall'utente e dopo aver chiamato la funzione getCatalogue                                               |
    * aggiorna la lista della boundary.                                                                       |
    *                                                                                                         |
    * Invocata da : research(), CatalogueBoundary                                                             |
    * --------------------------------------------------------------------------------------------------------*/
    public  ArrayList<Article> createCatalogue(String nome,  String proprietario,
                                String tipoArticolo, String editore, String autore, String titolo,
                                     String tipo, String marca, int taglia, String materia,
                                     int edizione, String modello) throws SQLException {

        Article rq = null;
        if (tipoArticolo.equals("Book")) {
            rq = ArticleFactory.getInstance().getBook();

            rq.setNome(checkString(nome));
            rq.setProprietario(checkString(proprietario));
            ((Book) rq).setEditore(checkString(editore));
            ((Book) rq).setAutore(checkString(autore));
            ((Book) rq).setTitolo(checkString(titolo));


        } else if (tipoArticolo.equals("Electronics")) {
            rq = ArticleFactory.getInstance().getElectronics();

            rq.setNome(checkString(nome));
            rq.setProprietario(checkString(proprietario));
            ((Electronics) rq).setTipo(checkString(tipo));
            ((Electronics) rq).setMarca(checkString(marca));
            ((Electronics) rq).setModello(checkString(modello));


        } else if (tipoArticolo.equals("Clothing")) {
            rq = ArticleFactory.getInstance().getClothing();

            rq.setNome(checkString(nome));
            rq.setProprietario(checkString(proprietario));
            ((Clothing) rq).setTipo(checkString(tipo));
            ((Clothing) rq).setMarca(checkString(marca));
            if (taglia < 0)
                ((Clothing) rq).setTaglia(0);
            else
                ((Clothing) rq).setTaglia(taglia);


        } else if (tipoArticolo.equals("TextBook")) {
            rq = ArticleFactory.getInstance().getTextBook();

            rq.setNome(checkString(nome));
            rq.setProprietario(checkString(proprietario));
            ((Book) rq).setEditore(checkString(editore));
            ((Book) rq).setAutore(checkString(autore));
            ((Book) rq).setTitolo(checkString(titolo));
            ((TextBook) rq).setMateria(checkString(materia));
            if (edizione < 0)
                ((TextBook) rq).setEdizione(0);
            else
                ((TextBook) rq).setEdizione(edizione);

        } else if (tipoArticolo.equals("")) {
            rq = ArticleFactory.getInstance().getArticle();
            rq.setNome(checkString(nome));

        }

        articoli = getCatalogue(rq);

        return articoli;
        /*int i = 0;
        while (i<articoli.size()) {
            JLabel row = new JLabel();
            row.setText(articoli.get(i).getNome());
            model.addElement(articoli.get(i).getNome());
            i++;
        }
        return model;*/

    }

    /* -------------------------------------------------------------------------------------------------------
    * Effettua la richiesta di query al database invocando la funzione searchArticle di DatabaseController.   |
    * Sfrutta la funzione sqlcreator per generare la stringa da passare al DatabaseController.                |
    * Torna un array di articoli a createCatalogue.                                                           |
    *                                                                                                         |
    * Invocata da : createCatalogue() , CatalogueController                                                   |
    * --------------------------------------------------------------------------------------------------------*/
    private ArrayList<Article> getCatalogue(Article rq) throws SQLException {

        String sql = sqlCreator(rq);
        ArrayList<Article> articoli;
        if(!sqlCheck(sql)){
            articoli = new ArrayList<Article>();
            return articoli;
        }
        System.out.println(sql);
        if (rq.getClass().equals(Book.class)) {
            articoli = DatabaseController.getInstance().searchArticle(sql, "Book");
        } else if (rq.getClass().equals(Electronics.class)) {
            articoli = DatabaseController.getInstance().searchArticle(sql, "Electronics");
        } else if (rq.getClass().equals(Clothing.class)) {
            articoli = DatabaseController.getInstance().searchArticle(sql, "Clothing");
        } else if (rq.getClass().equals(TextBook.class)) {
            articoli = DatabaseController.getInstance().searchArticle(sql, "TextBook");
        } else {
            articoli = DatabaseController.getInstance().searchArticle(sql, "generic");
        }

        if (articoli.size() != 0){
            return articoli;
        }
        else{
            if(!rq.getNome().equals("")){
                return levenshteinCheck(rq.getNome());
            }
            else
                return articoli;
        }
    }

    /* -------------------------------------------------------------------------------------------------------
   * rimuove dalla lista gli articoli che hanno un prezzo superiore a quello richiesto.                       |
   * Viene invocata direttamente dalla boundary.                                                              |
   *                                                                                                          |
   * Invocata da actionPerformed(), CatalogueBoundary                                                         |
    * --------------------------------------------------------------------------------------------------------*/

    /* -------------------------------------------------------------------------------------------------------
    * Controlla la correttezza delle stringhe inserite dall'utente nella boundary                             |
    *                                                                                                         |
    * Invocata da : createCatalogue(), CatalogueController                                                    |
    * --------------------------------------------------------------------------------------------------------*/
    private String checkString(String string) {
        String s;
        if(string.contains("''")){
            s = "";
            return s;
        }
        else
            return string.replace("'", "''");
    }

    /* -------------------------------------------------------------------------------------------------------
    * Genera la stringa sql che getCatalogue dovrà passare alla funzione searchArticle di DatabaseController  |
    *                                                                                                         |
    * Invocata da : getCatalogue(), CatalogueController                                                       |
    * --------------------------------------------------------------------------------------------------------*/
    private String sqlCreator(Article rq){
        int proprietario = 0;
        String sql;
        int isItTheFirst = 0;
        if (rq.getClass().equals(Book.class)) {

            sql = "SELECT * FROM ARTICLES.libro, ARTICLES.articolo WHERE ARTICLES.libro.NOME = ARTICLES.articolo.NOME AND ARTICLES.libro.PROPRIETARIO = ARTICLES.articolo.PROPRIETARIO AND ";
            if (!((Book) rq).getTitolo().equals("")) {
                sql = sql + "UPPER(ARTICLES.libro.TITOLO) LIKE UPPER('%" + rq.getNome() + "%') ";
                isItTheFirst++;
            }
            if (!((Book) rq).getAutore().equals("")) {
                if (isItTheFirst != 0) {
                    sql = sql + "AND ";
                }
                sql = sql + "UPPER(ARTICLES.libro.AUTORE) LIKE UPPER('%" + ((Book) rq).getAutore() + "%') ";
                isItTheFirst++;
            }
            if (!((Book) rq).getEditore().equals("")) {
                if (isItTheFirst != 0) {
                    sql = sql + "AND ";
                }
                sql = sql + "UPPER(ARTICLES.libro.CASA) LIKE UPPER('%" + ((Book) rq).getEditore() + "%') ";
                isItTheFirst++;
            }
            proprietario++;


        } else if (rq.getClass().equals(Clothing.class)) {
            sql = "SELECT * FROM ARTICLES.Abbigliamento, ARTICLES.articolo WHERE ARTICLES.Abbigliamento.NOME = ARTICLES.articolo.NOME AND ARTICLES.Abbigliamento.PROPRIETARIO = ARTICLES.articolo.PROPRIETARIO AND ";
            if (!((Clothing) rq).getTipo().equals("")) {
                sql = sql + "UPPER(ARTICLES.Abbigliamento.TIPO) LIKE UPPER('%" + ((Clothing) rq).getTipo() + "%') ";
                isItTheFirst++;
            }
            if (((Clothing) rq).getTaglia() != 0) {
                if (isItTheFirst != 0) {
                    sql = sql + "AND ";
                }
                sql = sql + "ARTICLES.Abbigliamento.TAGLIA ='" + ((Clothing) rq).getTaglia() + "' ";
                isItTheFirst++;
            }
            if (!((Clothing) rq).getMarca().equals("")) {
                if (isItTheFirst != 0) {
                    sql = sql + "AND ";
                }
                sql = sql + "UPPER(ARTICLES.Abbigliamento.MARCA) LIKE UPPER('%" + ((Clothing) rq).getMarca()+ "%') ";
                isItTheFirst++;
            }
            proprietario++;

        } else if (rq.getClass().equals(Electronics.class)) {
            sql = "SELECT * FROM ARTICLES.informatica, ARTICLES.articolo WHERE ARTICLES.informatica.NOME = ARTICLES.articolo.NOME AND ARTICLES.informatica.PROPRIETARIO = ARTICLES.articolo.PROPRIETARIO AND ";
            System.out.println(((Electronics) rq).getModello());
            if (!((Electronics) rq).getTipo().equals("")) {
                sql = sql + "UPPER(ARTICLES.informatica.TIPO) LIKE UPPER('%" + ((Electronics) rq).getTipo() + "%') ";
                isItTheFirst++;
            }
            if (!((Electronics) rq).getModello().equals("")) {
                if (isItTheFirst != 0) {
                    sql = sql + "AND ";
                }
                sql = sql + "UPPER(ARTICLES.informatica.MODELLO) LIKE UPPER('%" + ((Electronics) rq).getModello() + "%') ";
                isItTheFirst++;
            }
            if (!((Electronics) rq).getMarca().equals("")) {
                if (isItTheFirst != 0) {
                    sql = sql + "AND ";
                }
                sql = sql + "UPPER(ARTICLES.informatica.MARCA) LIKE UPPER('%" + ((Electronics) rq).getMarca() + "%') ";
                isItTheFirst++;
            }
            proprietario++;

        } else if (rq.getClass().equals(TextBook.class)) {
            sql = "SELECT * FROM ARTICLES.Scolastico, ARTICLES.articolo WHERE ARTICLES.Scolastico.NOME = ARTICLES.articolo.NOME AND ARTICLES.Scolastico.PROPRIETARIO = ARTICLES.articolo.PROPRIETARIO AND ";
            if (!((TextBook) rq).getMateria().equals("")) {
                sql = sql + "UPPER(ARTICLES.Scolastico.MATERIA) LIKE UPPER('%" + ((TextBook) rq).getMateria()+ "%') ";
                isItTheFirst++;
            }

            if (((TextBook) rq).getEdizione() != 0) {
                if (isItTheFirst != 0) {
                    sql = sql + "AND ";
                }
                sql = sql + "ARTICLES.Scolastico.EDIZIONE ='" + ((TextBook) rq).getEdizione() + "' ";
                isItTheFirst++;
            }
            proprietario++;

        } else {
            sql = "SELECT * FROM ARTICLES.articolo WHERE UPPER(articolo.NOME) LIKE UPPER('%" + rq.getNome() + "%') ";
        }


        if (proprietario == 1){
            if (!rq.getProprietario().equals("")) {
                if (isItTheFirst != 0) {
                    sql = sql + "AND ";
                }
                sql = sql + "UPPER(articolo.PROPRIETARIO) LIKE UPPER('%" + rq.getProprietario()+ "%') ";
                isItTheFirst++;
            }
            if (!rq.getNome().equals("")) {
                if (isItTheFirst != 0) {
                    sql = sql + "AND ";
                }
                sql = sql + "UPPER(articolo.NOME) LIKE UPPER('%" + rq.getNome() + "%') ";
            }
        }
        return sql;
    }

    /* -------------------------------------------------------------------------------------------------------
    * Effettua un controllo sulla stringa sql da passare a DatabaseController                                 |
*                                                                                                             |
    * Invocata da : getCatalogue(), CatalogueController                                                       |
    * --------------------------------------------------------------------------------------------------------*/
    private boolean sqlCheck(String sql){
        return !(sql.equals("SELECT * FROM ARTICLES.libro, ARTICLES.articolo WHERE ARTICLES.libro.NOME = ARTICLES.articolo.NOME AND ARTICLES.libro.PROPRIETARIO = ARTICLES.articolo.PROPRIETARIO AND ") ||
                sql.equals("SELECT * FROM ARTICLES.Abbigliamento, ARTICLES.articolo WHERE ARTICLES.Abbigliamento.NOME = ARTICLES.articolo.NOME AND ARTICLES.Abbigliamento.PROPRIETARIO = ARTICLES.articolo.PROPRIETARIO AND ") ||
                sql.equals("SELECT * FROM ARTICLES.informatica, ARTICLES.articolo WHERE ARTICLES.informatica.NOME = ARTICLES.articolo.NOME AND ARTICLES.informatica.PROPRIETARIO = ARTICLES.articolo.PROPRIETARIO AND ") ||
                sql.equals("SELECT * FROM ARTICLES.Scolastico, ARTICLES.articolo WHERE ARTICLES.Scolastico.NOME = ARTICLES.articolo.NOME AND ARTICLES.Scolastico.PROPRIETARIO = ARTICLES.articolo.PROPRIETARIO AND "));
    }

    /* -------------------------------------------------------------------------------------------------------
    * ritorna la distanza tra due stringhe utilizzando l'algoritmo di Levenshtein                             |
    *                                                                                                         |
    * Invocata da : levenshteinCheck(), CatalogueController                                                   |
    * --------------------------------------------------------------------------------------------------------*/
    private int levenshtein (CharSequence stringa1, CharSequence stringa2) {
        int len0 = stringa1.length() + 1;
        int len1 = stringa2.length() + 1;

        // array di distanze
        int[] valore1 = new int[len0];
        int[] valore2 = new int[len0];

        for (int i = 0; i < len0; i++) valore1[i] = i;

        for (int j = 1; j < len1; j++) {
            valore2[0] = j;

            for(int i = 1; i < len0; i++) {
                int match = (stringa1.charAt(i - 1) == stringa2.charAt(j - 1)) ? 0 : 1;

                int cost_replace = valore1[i - 1] + match;
                int cost_insert  = valore1[i] + 1;
                int cost_delete  = valore2[i - 1] + 1;

                valore2[i] = Math.min(Math.min(cost_insert, cost_delete), cost_replace);
            }

            int[] swap = valore1; valore1 = valore2; valore2 = swap;
        }

        return valore1[len0 - 1];
    }

    /* -------------------------------------------------------------------------------------------------------
    * Effettua una query al database su tutti gli articoli e ritorna tutti quelli che hanno distanza          |
    * di Levenshtein minore di 4                                                                              |
    *                                                                                                         |
    * Invocata da : getCatalogue(), CatalogueController                                                       |
    * --------------------------------------------------------------------------------------------------------*/
    private ArrayList<Article> levenshteinCheck(String nome) throws SQLException {
        ArrayList<Article> articoliVicini = new ArrayList<Article>();
        String sql = "SELECT * FROM ARTICLES.articolo";
        articoli = DatabaseController.getInstance().searchArticle(sql, "generic");
        if(articoli.size() != 0){
            for (Article a : articoli) {
                if (levenshtein(a.getNome(), nome) < 4) {
                    articoliVicini.add(a);
                }
            }
            return articoliVicini;
        }
        else
            return articoli;
    }

}
