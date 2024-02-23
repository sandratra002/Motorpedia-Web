package model;

import java.sql.*;
import java.util.ArrayList;

import database.SQLConnection;

public class EngineType {
    String id;
    String name;
    String description;

    
    public EngineType() {
    }
    
    public EngineType(String id, String name, String description) {
        setId(id);
        setName(name);
        setDescription(description);
    }

    public static int createEngineType(String name, String description) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        Class.forName("org.postgresql.Driver");
        int result = 0;
        try {
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/restaurant", "postgres",
                    "43710");
            connection.setAutoCommit(false);
            statement = connection.prepareStatement("INSERT INTO engine_type(name, description) VALUES(?, ?)");
            statement.setString(1, name);
            statement.setString(2, description);
            result = statement.executeUpdate();
            connection.commit();
        } catch (Exception err) {
            if (connection != null) {
                connection.rollback();
                connection.close();
            }
            throw err;
        } finally {
            statement.close();
            connection.close();
        }
        return result;
    }

    public static ArrayList<EngineType> readEngineType() throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet set = null;
        ArrayList<EngineType> engineTypes = new ArrayList<>();
        try {
            connection = SQLConnection.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement("SELECT * FROM engine_type");
            set = statement.executeQuery();
            while (set.next()) {
                EngineType engineType = new EngineType(set.getString("id"), set.getString("name"),
                        set.getString("description"));
                engineTypes.add(engineType);
            }
        } catch (Exception err) {
            if (connection != null) {
                connection.close();
            }
            throw err;
        } finally {
            set.close();
            statement.close();
            connection.close();
        }
        return engineTypes;
    }

    public static EngineType readEngineTypeById(String id) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet set = null;
        EngineType engineType = null;
        try {
            connection = SQLConnection.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement("SELECT * FROM engine_type WHERE id=?");
            statement.setString(1, id);
            set = statement.executeQuery();
            while (set.next()) {
                engineType = new EngineType(set.getString("id"), set.getString("name"), set.getString("description"));
            }
        } catch (Exception err) {
            if (connection != null) {
                connection.close();
            }
            throw err;
        } finally {
            set.close();
            statement.close();
            connection.close();
        }
        return engineType;
    }

    public static int updateEngineTypeById(String name, String description, String id) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        int result = 0;
        try {
            connection = SQLConnection.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement("UPDATE engine_type SET name=?, description=? WHERE id=?");
            statement.setString(1, name);
            statement.setString(2, description);
            statement.setString(3, id);
            result = statement.executeUpdate();
            connection.commit();
        } catch (Exception err) {
            if (connection != null) {
                connection.rollback();
                connection.close();
            }
            throw err;
        } finally {
            statement.close();
            connection.close();
        }
        return result;
    }

    public static int deleteEngineTypeById(String id) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        int result = 0;
        try {
            connection = SQLConnection.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement("DELETE FROM engine_type WHERE id=?");
            statement.setString(1, id);
            result = statement.executeUpdate();
            connection.commit();
        } catch (Exception err) {
            if (connection != null) {
                connection.rollback();
                connection.close();
            }
            throw err;
        } finally {
            statement.close();
            connection.close();
        }
        return result;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public String getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public String getDescription() {
        return this.description;
    }
}
