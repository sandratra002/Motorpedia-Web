package controller;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import model.Brand;

public class EditBrand extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (request.getParameter("mode") != null && request.getParameter("mode").equals("u")) {
                String id = request.getParameter("id");
                request.setAttribute("brand", Brand.readBrandById(id));
            }
            request.getRequestDispatcher("edit-brand.jsp").forward(request, response);
        } catch (Exception err) {
            err.printStackTrace(response.getWriter());
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String url = "edit-brand";
            String name = request.getParameter("name");
            String logo = request.getParameter("logo");
            String originCountry = request.getParameter("origin-country");
            if (request.getParameter("mode") != null && request.getParameter("mode").equals("u")) {
                url = url + "?mode=u";
                String id = request.getParameter("id");
                url = url + "&id=" + id;
                Brand.updateBrandById(name, logo, originCountry, id);
            } else {
                Brand.createBrand(name, logo, originCountry);
            }
            response.sendRedirect(url);
        } catch (Exception err) {
            err.printStackTrace(response.getWriter());
        }
    }

}
