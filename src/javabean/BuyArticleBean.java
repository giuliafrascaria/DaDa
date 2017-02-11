package javabean;


import control.DaDaSystem;
import exceptions.FailedPaymentException;

import javax.servlet.http.Part;
import java.io.Serializable;
import java.util.logging.Level;
import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;

public class BuyArticleBean implements Serializable  {

    private String nome = "";//acqiorente
    private String articolo = "";
    private String proprietario = "";
    private float prezzo;
    private float saldo;
    private int quantitaBuy;
    private int quantitatot;


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

    public float getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(float prezzo) {
        this.prezzo = prezzo;
    }

    public int getQuantitatot() {
        return quantitatot;
    }

    public int getQuantitaBuy() {
        return quantitaBuy;
    }

    public void setQuantitaBuy(int quantita) {
        this.quantitaBuy = quantita;
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

    public boolean SpendYourMoney() {
        if (quantitaBuy > quantitatot) {
            System.out.println("quantità richiesta : " + quantitaBuy +"quantità totale : " + quantitaBuy);
            return false;
        }
        else
            System.out.println("ok");
        if (saldo < prezzo * quantitaBuy){
            System.out.println("saldo corrente : " + saldo + " prezzo da scalare = " + prezzo*quantitaBuy);
            return false;
        }
        else {
            System.out.println("ok");
        }

        DaDaSystem.getInstance().buyArticle(nome, proprietario, articolo, saldo, prezzo, quantitaBuy, quantitatot);

        return true;
    }

    public void setSaldo(float saldocorrente) {
        this.saldo = saldocorrente;
    }

    public void setQuantitatot(int quantitatot) {
        this.quantitatot = quantitatot;
    }

    public void setArticolo(String articolo) {
        this.articolo = articolo;
    }
}




