package entity;

/**
 * Created by giogge on 24/12/16.
 */
public class Admin extends RegisteredUser
{
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
