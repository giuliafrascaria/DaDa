package entity.users;

/**
 * Created by giogge on 24/12/16.
 */
public class Admin extends RegisteredUser
{
    private String name, surname;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private float balance;

    public Admin() {}

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }
}
