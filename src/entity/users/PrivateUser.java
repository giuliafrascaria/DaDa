package entity.users;


import java.util.ArrayList;

public class PrivateUser extends RegisteredUser
{
    private String name, surname;

    private ArrayList articoliAcquistati, articoliVenduti, articoliinVendita;

    public PrivateUser() {}

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }


}
