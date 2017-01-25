package entity.users;


public class RegisteredUser
{
    protected String email, password;

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPwd()
    {
        return password;
    }

    public void setPwd(String pwd)
    {
        this.password = pwd;
    }
}
