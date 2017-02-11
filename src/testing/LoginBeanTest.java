package testing;


import javabean.LoginBean;
import org.junit.Assert;
import org.junit.Test;

import static org.junit.Assert.*;


public class LoginBeanTest {

    private String email;
    private String pwd;

    @Test
    public void validate() throws Exception
    {
        LoginBean loginBean = new LoginBean();


        try {
            int result;

            loginBean.setEmail("a");
            loginBean.setPassword("a");


            this.email = "a";
            this.pwd= "a";

            result = loginBean.validate();

            Assert.assertEquals(result, 1);
            Assert.assertEquals(email, loginBean.getEmail());
            Assert.assertEquals(pwd, loginBean.getPassword());
            //Assert.assertEquals(1, loginBean.getAccountType());

            //login riuscito



            loginBean.setEmail("c");
            loginBean.setPassword("");

            result = loginBean.validate();

            Assert.assertEquals(result, 2);

            //form incompleto



            loginBean.setEmail("c");
            loginBean.setPassword("a");

            result = loginBean.validate();

            Assert.assertEquals(result, 3);

            //utente non esistente



            loginBean.setEmail("a");
            loginBean.setPassword("c");
            result = loginBean.validate();

            Assert.assertEquals(result, 4);
            //password errata

        } catch (Exception e) {
            e.printStackTrace();
            fail("Errore");
        }
    }

}