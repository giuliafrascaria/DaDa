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
            System.out.println("test numero 1 " + loginBean.getEmail() + loginBean.getPassword());
            Assert.assertEquals(1, result);
            Assert.assertEquals(email, loginBean.getEmail());
            Assert.assertEquals(pwd, loginBean.getPassword());
            Assert.assertEquals(1, loginBean.getAccountType());

            //login riuscito



            loginBean.setEmail("c");
            loginBean.setPassword("");

            result = loginBean.validate();
            System.out.println("test numero 2 " + loginBean.getEmail() + loginBean.getPassword());
            Assert.assertEquals(2, result);

            //form incompleto



            loginBean.setEmail("c");
            loginBean.setPassword("a");

            result = loginBean.validate();
            System.out.println("test numero 3 " + loginBean.getEmail() + loginBean.getPassword());
            Assert.assertEquals(3, result);

            //utente non esistente



            loginBean.setEmail("a");
            loginBean.setPassword("c");
            result = loginBean.validate();
            System.out.println("test numero 4 " + loginBean.getEmail() + loginBean.getPassword());
            Assert.assertEquals(4, result);
            //password errata

        } catch (Exception e) {
            e.printStackTrace();
            fail("Errore");
        }
    }

}