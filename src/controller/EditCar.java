package controller;

import java.io.*;
import java.util.HashMap;

import conf.ConfigInfo;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import model.Car;
import model.Brand;
import model.TransmissionType;
import util.StringParse;
import model.Category;
import model.EngineType;

@MultipartConfig
public class EditCar extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("brands", Brand.readBrand());
            request.setAttribute("transmissions", TransmissionType.readTransmissionType());
            request.setAttribute("categories", Category.readCategory());
            request.setAttribute("engines", EngineType.readEngineType());
            HashMap<String, String> infos = new HashMap<String, String>();
            infos.put("brand", "");
            infos.put("transmission_type", "");
            infos.put("category", "");
            infos.put("engine_type", "");
            if (request.getParameter("mode") != null && request.getParameter("mode").equals("u")) {
                String id = request.getParameter("id");
                request.setAttribute("car", Car.readCarById(id));
                infos = Car.getCarInfo(id);
            }
            request.setAttribute("info", infos);
            request.getRequestDispatcher("./pages/index.jsp?page=edit-car").forward(request, response);
        } catch (Exception err) {
            err.printStackTrace(response.getWriter());
        }
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String url = "./list-car";PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        int year = Integer.parseInt(request.getParameter("year"));
        double price = Double.parseDouble(request.getParameter("price"));
        int seatingCapacity = Integer.parseInt(request.getParameter("seating-capacity"));
        String brandId = request.getParameter("brand-id");
        String transmissionTypeId = request.getParameter("transmission-type-id");
        String categoryId = request.getParameter("category-id");
        String engineTypeId = request.getParameter("engine-type-id");
        Part part = request.getPart("image");

        String extension = StringParse.getExtension(part.getSubmittedFileName());
        String imageName = name.replaceAll(" ", "-").toLowerCase()  + "." + extension;

        Brand brand = Brand.readBrandById(brandId);

        HashMap<String, String> infos = ConfigInfo.getServerInfo();

        String filePath = infos.get("image-path") + "\\" + brand.getName() +"\\" + imageName;
        part.write(filePath);

        if (request.getParameter("mode") != null && request.getParameter("mode").equals("u")) {
            url = url + "?mode=u";
            String id = request.getParameter("id");
            url = url + "&id=" + id;
            if(request.getParameter("image-name") != null){
                imageName = request.getParameter("image-name");
            }
            int h = Car.updateCarById(name, year, price, seatingCapacity, imageName, brandId, transmissionTypeId, categoryId,
                    engineTypeId, id);
            out.println(h);
            out.println(seatingCapacity);
            out.println("Update car....");
        } else {
            Car.createCar(name, year, price, seatingCapacity, imageName, brandId, transmissionTypeId, categoryId,engineTypeId);
        }
        response.sendRedirect(url);  
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            PrintWriter out = response.getWriter();
        try {
            handleRequest(request, response);
        } catch (Exception err) {
            out.print(err);
            err.printStackTrace(response.getWriter());
        }
    }
}
