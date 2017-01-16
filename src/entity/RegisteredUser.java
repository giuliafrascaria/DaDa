package entity;

/**
 * Created by giogge on 24/12/16.
 */
public class RegisteredUser
{
    protected String email;
    protected char[] pwd;

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public char[] getPwd()
    {
        return pwd;
    }

    public void setPwd(char[] pwd)
    {
        this.pwd = pwd;
    }
}
