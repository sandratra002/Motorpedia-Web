package testing;

import model.Authentication;
import model.Userinfo;

public class Main {
    public static void main(String[] args) {
        try {
            // Userinfo.createUserinfo("Aina", "Sandratra", "aina@gmail.com", "aina");
            Userinfo info = Authentication.login("aina@gmail.com", "aina1");
            if(info != null){
                System.out.println(info.getName());
            }else{
                System.out.println("Login failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
