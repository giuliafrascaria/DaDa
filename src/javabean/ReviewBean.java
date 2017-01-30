package javabean;


import control.ArticlesController;
import control.DatabaseController;

public class ReviewBean {

    private String utente = "";
    private String articolo = "";
    private String proprietario = "";
    private String testo = "";
    private int rating = 3;


    public String getUtente() {
        return utente;
    }

    public void setUtente(String utente) {
        this.utente = utente;
    }

    public String getArticolo() {
        return articolo;
    }

    public void setArticolo(String articolo) {
        this.articolo = articolo;
    }

    public String getProprietario() {
        return proprietario;
    }

    public void setProprietario(String proprietario) {
        this.proprietario = proprietario;
    }

    public String getTesto() {
        return testo;
    }

    public void setTesto(String testo) {
        this.testo = testo;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public boolean setReview(int kind) {

        System.out.println("inizio l'operazione");
        try {
            if(kind == 0) {
                System.out.println("entro in review");
                if (ArticlesController.getInstance().sendReview(testo, articolo, utente, rating, proprietario) == 0)
                    return false;
            }
            else if(kind==1){
                System.out.println("entro in warning");
                if (DatabaseController.getInstance().setWarningUser(testo, proprietario, utente) == 0)
                    return false;
            }
            else{
                System.out.println("entro in warning articolo");
                if (ArticlesController.getInstance().sendWarning(testo,proprietario , utente, articolo) == 0)
                    return false;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("torno false");
            return false;
        }
        System.out.println("torno true");
        return true;
    }

    public void resetBean(){
        this.utente = "";
        this.articolo = "";
        this.proprietario = "";
        this.testo = "";
        this.rating = 3;
    }

}
