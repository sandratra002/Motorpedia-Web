package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.SQLConnection;

public class Authentication {
    public static Userinfo login(String email, String password) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet set = null;
        Userinfo userinfo = null;
        try {
            connection = SQLConnection.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement("SELECT * FROM userinfo WHERE email = ? AND password = encode(digest(?, 'sha256'), 'hex')");
            statement.setString(1, email);
            statement.setString(2, password);
            set = statement.executeQuery();
            if (set.next()) {
                userinfo = new Userinfo(
                                set.getString("id"), 
                                set.getString("name"), 
                                set.getString("first_name"), 
                                set.getString("email"), 
                                set.getString("password")
                );
            }
        } catch (Exception err) {
            if (connection != null) {
                connection.close();
            }
            throw err;
        } finally {
            if (set != null)
                set.close();
            if (statement != null)
                statement.close();
            if (connection != null)
                connection.close();
        }
        return userinfo;
    }
}
