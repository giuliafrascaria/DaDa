package testing;

import javabean.RegistrationBean;
import org.junit.Assert;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by giogge on 08/02/17.
 */
public class RegistrationBeanTest {

    private String name, surname, email, password, confirmpassword;

    private Float balance = 0f;

    @Test
    public void validate() throws Exception
    {
        RegistrationBean registrationBean = new RegistrationBean();
        registrationBean.setEmail("b");
        registrationBean.setName("b");
        registrationBean.setSurname("b");
        registrationBean.setPassword("b");
        registrationBean.setConfirmpassword("b");
        registrationBean.setPassword("b");


        try {
            int result;
            result = registrationBean.validate();

            this.email = "b";
            this.password= "b";
            this.name = "b";
            this.surname = "b";

            /*Assert.assertEquals(result, 1);
            Assert.assertEquals(email, loginBean.getEmail());
            Assert.assertEquals(pwd, loginBean.getPassword());
            Assert.assertEquals(1, loginBean.getAccountType());

            result = loginBean.validate();
            //login riuscito

            this.email = "c";
            this.pwd= "";

            Assert.assertEquals(result, 2);
            //form incompleto

            this.email = "c";
            this.pwd= "a";

            Assert.assertEquals(result, 3);
            //utente non esistente

            this.email = "a";
            this.pwd= "c";

            Assert.assertEquals(result, 4);
            //password errata*/

        } catch (Exception e) {
            e.printStackTrace();
            fail("Errore");
        }
    }

}