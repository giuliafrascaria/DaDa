package entity.users;


public class RegisteredUser
{
    protected String email, password;

    protected int type;

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

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
