package javabean;

import control.PrivateDBcontroller;

/**
 * Created by giogge on 30/01/17.
 */


public class WalletBean {

    private float balance, importo;
    private String user;

    public float incrementBalance()
    {
        try {
            float newBalance = balance+importo;
            PrivateDBcontroller.getOurInstance().addMoney(user, newBalance);
            return newBalance;
        }
        catch (Exception e)
        {
            return 0;
        }

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

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
}
