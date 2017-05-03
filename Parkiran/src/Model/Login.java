/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Archi3
 */
public class Login {
    private String user;
    private String pass;
    
    public Login(){
        
    }
    public Login(String user, String pass){
        this.user = user;
        this.pass = pass;
    }
    public String getUser(){
        return user;
    }
    public String getPass(){
        return pass;
    }
    public void setUser(String user){
        this.user = user;
    }
    public void setPass(String pass){
        this.pass = pass;
    }
}
