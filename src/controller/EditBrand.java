package controller;

import java.io.*;
import java.io.ObjectInputFilter.Config;
import java.util.ArrayList;
import java.util.HashMap;

import conf.ConfigInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import model.Brand;
import util.StringParser;

@MultipartConfig
public class EditBrand extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String path = "webapps\\Motorpedia\\conf\\countries.xml";
            ArrayList<String>  countries = ConfigInfo.getInfo(path);
            request.setAttribute("countries", countries);
            if (request.getParameter("mode") != null && request.getParameter("mode").equals("u")) {
                String id = request.getParameter("id");
                request.setAttribute("brand", Brand.readBrandById(id));
            }
            request.getRequestDispatcher("./pages/index.jsp?page=edit-brand").forward(request, response);
        } catch (Exception err) {
            err.printStackTrace(response.getWriter());
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String url = "list-brand";
            String name = request.getParameter("name");
            String logo = request.getParameter("logo");
            String originCountry = request.getParameter("origin-country");
            
            Part part = request.getPart("logo");
            HashMap<String, String> infos = ConfigInfo.getServerInfo();
            String extension = StringParser.getExtension(part.getSubmittedFileName());
            String imageName = name.replaceAll(" ", "-").toLowerCase()  + "." + extension;
            String filePath = infos.get("logo-path") +"\\" + imageName;
            part.write(filePath);

            if (request.getParameter("mode") != null && request.getParameter("mode").equals("u")) {
                url = url + "?mode=u";
                String id = request.getParameter("id");
                url = url + "&id=" + id;
                if(request.getParameter("image-name") != null){
                    imageName = request.getParameter("image-name");
                }
                url = "list-brand";
                Brand.updateBrandById(name, imageName, originCountry, id);
            } else {
                Brand.createBrand(name, imageName, originCountry);
            }
            response.sendRedirect(url);
        } catch (Exception err) {
            err.printStackTrace(response.getWriter());
        }
    }

}
