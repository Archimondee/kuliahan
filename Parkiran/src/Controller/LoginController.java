/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Koneksian.Koneksi;
import Model.Login;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author Archi3
 */
public class LoginController {
    public static ResultSet cobaLogin(Login login) throws ClassNotFoundException, SQLException{
        Koneksi koneksi = new Koneksi();
        koneksi.dbConnection();
        String query = "SELECT * FROM testing WHERE username = '" + login.getUser() + "' AND password = '" + login.getPass() + "'";
        Statement stm = koneksi.getConnection().createStatement();
        ResultSet executeUpdate = stm.executeQuery(query);
        return executeUpdate;
    }
}
