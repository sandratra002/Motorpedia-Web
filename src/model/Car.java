package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import database.SQLConnection;

public class Car {
    String id;
    String name;
    int year;
    double price;
    int seatingCapacity;
    String image;
    String brandId;
    String transmissionTypeId;
    String categoryId;
    String engineTypeId;

    public Car() {
    }

    public Car(String id, String name, int year, double price, int seatingCapacity, String image, String brandId,
            String transmissionTypeId, String categoryId, String engineTypeId) {
        setId(id);
        setName(name);
        setYear(year);
        setPrice(price);
        setSeatingCapacity(seatingCapacity);
        setImage(image);
        setBrandId(brandId);
        setTransmissionTypeId(transmissionTypeId);
        setCategoryId(categoryId);
        setEngineTypeId(engineTypeId);
    }

    public static HashMap<String, String> getCarInfo(String id) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet set = null;
        HashMap<String, String> categorys = new HashMap<String, String>();
        try {
            connection = SQLConnection.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement("SELECT * FROM v_Car_Info WHERE id = ?");
            statement.setString(1, id);
            set = statement.executeQuery();
            while (set.next()) {
                categorys.put("brand", set.getString("brand"));
                categorys.put("transmission_type", set.getString("transmission_type"));
                categorys.put("category", set.getString("category"));
                categorys.put("engine_type", set.getString("engine_type"));
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
        return categorys;
    }

    public static int createCar(String name, int year, double price, int seatingCapacity, String image, String brandId,
            String transmissionTypeId, String categoryId, String engineTypeId) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        int result = 0;
        try {
            connection = SQLConnection.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(
                    "INSERT INTO car(name, year, price, seating_capacity, image, brand_id, transmission_type_id, category_id, engine_type_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)");
            statement.setString(1, name);
            statement.setInt(2, year);
            statement.setDouble(3, price);
            statement.setInt(4, seatingCapacity);
            statement.setString(5, image);
            statement.setString(6, brandId);
            statement.setString(7, transmissionTypeId);
            statement.setString(8, categoryId);
            statement.setString(9, engineTypeId);
            result = statement.executeUpdate();
            connection.commit();
        } catch (Exception err) {
            if (connection != null) {
                connection.rollback();
                connection.close();
            }
            throw err;
        } finally {
            if (statement != null)
                statement.close();
            if (connection != null)
                connection.close();
        }
        return result;
    }

    public static ArrayList<Car> readCar() throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet set = null;
        ArrayList<Car> cars = new ArrayList<>();
        try {
            connection = SQLConnection.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement("SELECT * FROM car");
            set = statement.executeQuery();
            while (set.next()) {
                Car car = new Car(set.getString("id"), set.getString("name"), set.getInt("year"),
                        set.getDouble("price"), set.getInt("seating_capacity"), set.getString("image"),
                        set.getString("brand_id"), set.getString("transmission_type_id"), set.getString("category_id"),
                        set.getString("engine_type_id"));
                cars.add(car);
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
        return cars;
    }

    public static Car readCarById(String id) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet set = null;
        Car car = null;
        try {
            connection = SQLConnection.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement("SELECT * FROM car WHERE id=?");
            statement.setString(1, id);
            set = statement.executeQuery();
            while (set.next()) {
                car = new Car(set.getString("id"), set.getString("name"), set.getInt("year"), set.getDouble("price"),
                        set.getInt("seating_capacity"), set.getString("image"), set.getString("brand_id"),
                        set.getString("transmission_type_id"), set.getString("category_id"),
                        set.getString("engine_type_id"));
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
        return car;
    }

    public static int updateCarById(String name, int year, double price, int seatingCapacity, String image,
            String brandId, String transmissionTypeId, String categoryId, String engineTypeId, String id)
            throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        int result = 0;
        try {
            connection = SQLConnection.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(
                    "UPDATE car SET name=?, year=?, price=?, seating_capacity=?, image=?, brand_id=?, transmission_type_id=?, category_id=?, engine_type_id=? WHERE id=?");
            statement.setString(1, name);
            statement.setInt(2, year);
            statement.setDouble(3, price);
            statement.setInt(4, seatingCapacity);
            statement.setString(5, image);
            statement.setString(6, brandId);
            statement.setString(7, transmissionTypeId);
            statement.setString(8, categoryId);
            statement.setString(9, engineTypeId);
            statement.setString(10, id);
            result = statement.executeUpdate();
            connection.commit();
        } catch (Exception err) {
            if (connection != null) {
                connection.rollback();
                connection.close();
            }
            throw err;
        } finally {
            if (statement != null)
                statement.close();
            if (connection != null)
                connection.close();
        }
        return result;
    }

    public static int deleteCarById(String id) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        int result = 0;
        try {
            connection = SQLConnection.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement("DELETE FROM car WHERE id=?");
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

    public void setYear(int year) {
        this.year = year;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setSeatingCapacity(int seatingCapacity) {
        this.seatingCapacity = seatingCapacity;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setBrandId(String brandId) {
        this.brandId = brandId;
    }

    public void setTransmissionTypeId(String transmissionTypeId) {
        this.transmissionTypeId = transmissionTypeId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public void setEngineTypeId(String engineTypeId) {
        this.engineTypeId = engineTypeId;
    }

    public String getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public int getYear() {
        return this.year;
    }

    public double getPrice() {
        return this.price;
    }

    public int getSeatingCapacity() {
        return this.seatingCapacity;
    }

    public String getImage() {
        return this.image;
    }

    public String getBrandId() {
        return this.brandId;
    }

    public String getTransmissionTypeId() {
        return this.transmissionTypeId;
    }

    public String getCategoryId() {
        return this.categoryId;
    }

    public String getEngineTypeId() {
        return this.engineTypeId;
    }
}
