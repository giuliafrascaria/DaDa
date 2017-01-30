package javabean;

/**
 * Created by giogge on 30/01/17.
 */


public class WalletBean {

    private float balance, importo;

    public float incrementBalance()
    {
        float newBalance = balance+importo;
        return newBalance;
        //aggiorna nel DB
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }

    public float getBalance() {
        return balance;
    }

    public float getImporto() {
        return importo;
    }

    public void setImporto(float importo) {
        this.importo = importo;
    }
}
