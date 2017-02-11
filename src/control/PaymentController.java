package control;

import exceptions.FailedAddAcquisto;
import exceptions.FailedAddMoneyException;
import exceptions.FailedDecreaseException;
import exceptions.FailedPaymentException;
/**
 * Created by giogge on 10/02/17.
 */
public class PaymentController extends Thread {

    //ho degli attributi di classe che sono i valori da disfare in caso di fallimento
    float previousBalance, price;
    int quantity, totQuantity;
    String buyer, owner, articleName;

    PaymentController(float price, float previousBalance, int quantity, int totQuantity, String buyer, String owner, String articleName)
    {
        this.price = price;
        this.buyer = buyer;
        this.owner = owner;
        this.totQuantity = totQuantity;
        this.articleName = articleName;
        this.quantity = quantity;
        this.previousBalance = previousBalance;
    }

    @Override
    public void run()
    {
        //tutte le operazioni che stiamo chiamando da spendyourmoney
        try{
            if(PrivateDBcontroller.getOurInstance().removeMoney(buyer, (previousBalance - price*quantity))) {
                if (DatabaseController.getInstance().decreaseQuantity(articleName.replaceAll("'", "''"), owner, totQuantity - quantity)) {
                    if (PrivateDBcontroller.getOurInstance().addAcquisto(buyer, owner, articleName.replaceAll("'", "''"))) {
                        if(!(DatabaseController.getInstance().addMoney(owner, price * quantity))) {
                            throw new FailedAddMoneyException();
                        }
                    }
                    else {
                        throw new FailedAddAcquisto();
                    }
                }
                else {
                    throw new FailedDecreaseException();
                }
            }
            else {
                throw new FailedPaymentException();//rimetti i soldi
            }
        }
        catch (FailedPaymentException e)
        {
            //notificare con un observer e basta
        }
        catch (FailedDecreaseException e)
        {
            //notificare observer e disfare pagamento
        }
        catch (FailedAddAcquisto e)
        {
            //notificare observer e disfare pagamento e quantity decrease
        }
        catch (FailedAddMoneyException e)
        {
            //notificare observer e disfare pagamento, quantity decrease e addAcquisto
        }
        catch (Exception e)
        {
            //notificare con un observer e disfare il tutto tranne l'ultimo step
        }
    }

    private void undoPayment()
    {

    }
}
