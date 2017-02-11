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

            Assert.assertEquals(1, result);
            Assert.assertEquals(email, registrationBean.getEmail());
            Assert.assertEquals(password, registrationBean.getPassword());
            //registrazione riuscita

            registrationBean.setEmail("b");
            registrationBean.setName("");

            result = registrationBean.validate();
            Assert.assertEquals(result, 5);
            //form incompleto


            registrationBean.setEmail("a");
            registrationBean.setName("a");
            result = registrationBean.validate();
            Assert.assertEquals(2, result);
            //utente già registrato

        } catch (Exception e) {
            e.printStackTrace();
            fail("Errore");
        }
    }

}