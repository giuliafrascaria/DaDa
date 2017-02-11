package javabean;

import control.DaDaSystem;
import control.PrivateDBcontroller;
import exceptions.ErrorInBalanceException;




public class WalletBean {

    private float balance, importo, newbalance;
    private String user;

    public int incrementBalance()
    {
        try {
            this.newbalance = balance+importo;

            DaDaSystem.getInstance().addMoney(user, newbalance);
            return 0;
        }
        catch (ErrorInBalanceException e)
        {
            return 1;
        }
        catch (Exception e)
        {
            return 2;
        }

        //aggiorna nel DB
    }

    public float getNewbalance() {
        return newbalance;
    }

    public void setNewbalance(float newbalance) {
        this.newbalance = newbalance;
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
