package javabean;


import control.ArticlesController;

public class ReviewBean {

    private boolean segnalazione;
    private boolean tocheck;
    private String utente = "";
    private String articolo = "";
    private String proprietario = "";
    private String testo = "";
    private int rating = 3;

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
            this.setSegnalazione(false);
        else
            this.setSegnalazione(true);

        this.setTocheck(true);
        System.out.println("inizio l'operazione");
        try {
            if(ArticlesController.getInstance().sendReview(testo, articolo, utente, rating, proprietario) == 0)
                return false;
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
