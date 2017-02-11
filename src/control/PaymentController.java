package control;

/**
 * Created by giogge on 10/02/17.
 */
public class PaymentController extends Thread {

    //ho degli attributi di classe che sono i valori da disfare in caso di fallimento
    float previousBalance;
    int quantity;
    String buyer, owner;

    PaymentController(float previousBalance, int quantity, String buyer, String owner)
    {
        this.buyer = buyer;
        this.owner = owner;
        this.quantity = quantity;
        this.previousBalance = previousBalance;
    }

    @Override
    public void run()
    {
        //tutte le operazioni che stiamo chiamando da spendyourmoney
        /*if(DaDaSystem.getInstance().removeMoney(buyer, (prezzocorrente - prezzo*quantitaBuy)))
            if(DaDaSystem.getInstance().decreaseQuantity(articolo.replaceAll("'", "''"), proprietario, quantitatot-quantitaBuy)){
                if(DaDaSystem.getInstance().addAcquisto(nome, proprietario, articolo.replaceAll("'", "''")))
                {
                    try {
                        DaDaSystem.getInstance().addMoney(proprietario, prezzo*quantitaBuy);
                    } catch (Exception e) {
                        //rimetti i soldi, aggiungi quantità e togli acquisto da tabella
                        e.printStackTrace();
                    }
                    return true;
                }
                else {
                    //rimetti soldi e aggiungi quantità
                    return false;
                }
            }
            else
                //rimetti i soldi
                return false;
        else
            return false;*/
    }
}
