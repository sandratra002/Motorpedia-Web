package controller;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Car;

public class ListCar extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (request.getParameter("mode") != null && request.getParameter("mode").equals("d")) {
                String id = request.getParameter("id");
                Car.deleteCarById(id);
            }
            ArrayList<Car> cars = Car.readCar();
            HashMap<String, HashMap<String, String>> infos = new HashMap<String, HashMap<String, String>>();
            for(Car car : cars){
                infos.put(car.getId(), Car.getCarInfo(car.getId()));
            }
            request.setAttribute("infos", infos);
            request.setAttribute("cars", cars);
            request.getRequestDispatcher("./pages/index.jsp?page=list-car").forward(request, response);
        } catch (Exception err) {
            err.printStackTrace(response.getWriter());
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}
