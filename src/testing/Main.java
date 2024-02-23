package testing;

import model.Car;

import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        try {
            HashMap<String, String> info = Car.getCarInfo("CAR0001");
            System.out.println(info.get(""));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
