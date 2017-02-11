package javabean;

import control.RegisteredDBController;
import entity.users.RegisteredUser;

import java.util.ArrayList;
import java.util.List;
import control.RegisteredUserController;

/**
 * Created by v2devnull on 03/02/17.
 */
public class ListRegisteredUsersBean {

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAccounttype() {
        return accounttype;
    }

    public void setAccounttype(String accounttype) {
        this.accounttype = accounttype;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Boolean getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Boolean isvalid) {
        this.isvalid = isvalid;
    }

    private String email;
    private String accounttype;
    private String password;
    private String contact;
    private Boolean isvalid;

    public ListRegisteredUsersBean(){
        this.email = "";
        this.accounttype = "";
        this.password = "";
        this.contact = "";
        this.isvalid = false;
    }

    public String submission(){
        String click= "Cliccato\n";
        return click;
    }

    public ArrayList<RegisteredUser> listRegisteredUsers() throws Exception{
        ArrayList<RegisteredUser> listregisteredusers;
        RegisteredUser reg = new RegisteredUser();
        RegisteredDBController rdbc = RegisteredDBController.getOurInstance();
        listregisteredusers = rdbc.listAllUsers();
        return listregisteredusers;
    }

    public void validateUser(String email) throws Exception{
        RegisteredDBController rdbc = RegisteredDBController.getOurInstance();
        rdbc.validate(email);

    }

    public void deleteUser(String email) throws Exception{
        RegisteredDBController rdbc = RegisteredDBController.getOurInstance();
        rdbc.delete(email);
    }

}
