package testing;


import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)

@Suite.SuiteClasses({
        LoginBeanTest.class,
        ResearchTest.class,
        RegistrationBeanTest.class,
        ReviewSegnalazioneTesting.class
})

public class TestSuite {
}