package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Car;
import model.Brand;
import model.TransmissionType;
import model.Category;
import model.EngineType;

public class EditCar extends HttpServlet
{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            request.setAttribute("options-6", Brand.readBrand());
            request.setAttribute("options-7", TransmissionType.readTransmissionType());
            request.setAttribute("options-8", Category.readCategory());
            request.setAttribute("options-9", EngineType.readEngineType());
            if(request.getParameter("mode") != null && request.getParameter("mode").equals("u"))
            {
                String id = request.getParameter("id");
                request.setAttribute("car", Car.readCarById(id));
            }
            request.getRequestDispatcher("edit-car.jsp").forward(request, response);
        }
        catch(Exception err)
        {
            err.printStackTrace(response.getWriter());
        }
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            String url = "edit-car";
            String name = request.getParameter("name");
            int year = Integer.parseInt(request.getParameter("year"));
            double price = Double.parseDouble(request.getParameter("price"));
            int seatingCapacity = Integer.parseInt(request.getParameter("seating-capacity"));
            String image = request.getParameter("image");
            String brandId = request.getParameter("brand-id");
            String transmissionTypeId = request.getParameter("transmission-type-id");
            String categoryId = request.getParameter("category-id");
            String engineTypeId = request.getParameter("engine-type-id");
            if(request.getParameter("mode") != null && request.getParameter("mode").equals("u"))
            {
                url = url + "?mode=u";
                String id = request.getParameter("id");
                url = url + "&id=" + id;
                Car.updateCarById(name, year, price, seatingCapacity, image, brandId, transmissionTypeId, categoryId, engineTypeId, id);
            }
            else
            {
                Car.createCar(name, year, price, seatingCapacity, image, brandId, transmissionTypeId, categoryId, engineTypeId);
            }
            response.sendRedirect(url);
        }
        catch(Exception err)
        {
            err.printStackTrace(response.getWriter());
        }
    }
    
}
