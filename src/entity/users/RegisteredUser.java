package entity.users;


public class RegisteredUser
{

    public RegisteredUser(){

    }

    public RegisteredUser(String email){
        this.email = email;
    }

    public RegisteredUser(String email, Integer accounttype, String password, String contact, Boolean isvalid){
        this.email = email;
        this.type = accounttype;
        this.password = password;
        this.contact = contact;
        this.isvalid = isvalid;
    }

    protected String email, password, contact;

    protected int type;

    protected Boolean isvalid;

    public void setValid(Boolean isvalid){
        this.isvalid = isvalid;
    }

    public Boolean getValid(){
        return isvalid;
    }

    private float balance;

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public void setContact(String contact)
    {
        this.contact = contact;
    }

    public String getContact(){
        return contact;
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

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }
}
