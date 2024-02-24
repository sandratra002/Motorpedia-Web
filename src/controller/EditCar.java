package controller;

import java.io.*;
import java.util.HashMap;

import com.oreilly.servlet.MultipartRequest;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Car;
import model.Brand;
import model.TransmissionType;
import model.Category;
import model.EngineType;

public class EditCar extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("brands", Brand.readBrand());
            request.setAttribute("transmissions", TransmissionType.readTransmissionType());
            request.setAttribute("categories", Category.readCategory());
            request.setAttribute("engines", EngineType.readEngineType());
            if (request.getParameter("mode") != null && request.getParameter("mode").equals("u")) {
                String id = request.getParameter("id");
                request.setAttribute("car", Car.readCarById(id));
            }
            request.getRequestDispatcher("./pages/index.jsp?page=edit-car").forward(request, response);
        } catch (Exception err) {
            err.printStackTrace(response.getWriter());
        }
    }

    private static HashMap<String, String> getParemeters(HttpServletRequest request) throws Exception{
        HashMap<String, String> parameters = new HashMap<String, String>();

        String uploadPath = "";

        MultipartRequest mrequest = new MultipartRequest(request, uploadPath, 40960);

        

        return parameters;
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // PrintWriter out = response.getWriter();
        try {
            String url = "./pages/index.jsp?page=list-car&scroll=1";
            String name = request.getParameter("name");
            int year = Integer.parseInt(request.getParameter("year"));
            double price = Double.parseDouble(request.getParameter("price"));
            int seatingCapacity = Integer.parseInt(request.getParameter("seating-capacity"));
            String image = request.getParameter("image");
            String brandId = request.getParameter("brand-id");
            String transmissionTypeId = request.getParameter("transmission-type-id");
            String categoryId = request.getParameter("category-id");
            String engineTypeId = request.getParameter("engine-type-id");
            if (request.getParameter("mode") != null && request.getParameter("mode").equals("u")) {
                url = url + "&mode=u";
                String id = request.getParameter("id");
                url = url + "&id=" + id;
                Car.updateCarById(name, year, price, seatingCapacity, image, brandId, transmissionTypeId, categoryId,
                        engineTypeId, id);
            } else {
                Car.createCar(name, year, price, seatingCapacity, image, brandId, transmissionTypeId, categoryId,
                        engineTypeId);
            }
            response.sendRedirect(url);
        } catch (Exception err) {
            err.printStackTrace(response.getWriter());
        }
    }
}
