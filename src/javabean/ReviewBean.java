package javabean;


import control.ArticlesController;

public class ReviewBean {

    private boolean segnalazione;
    private boolean tocheck;
    private String utente = "";
    private String articolo = "";
    private String proprietario = "";
    private String testo = "";
    private int rating;

    public boolean isSegnalazione() {
        return segnalazione;
    }

    private void setSegnalazione(boolean segnalazione) {
        this.segnalazione = segnalazione;
    }

    public boolean isTocheck() {
        return tocheck;
    }

    private void setTocheck(boolean tocheck) {
        this.tocheck = tocheck;
    }

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
        if(kind == 0)
            setSegnalazione(false);
        else
            setSegnalazione(true);

        setTocheck(true);

        try {
            ArticlesController.getInstance().sendReview(testo, articolo, utente, rating, proprietario);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
