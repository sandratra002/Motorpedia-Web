package controller;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Category;

public class EditCategory extends HttpServlet
{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            if(request.getParameter("mode") != null && request.getParameter("mode").equals("u"))
            {
                String id = request.getParameter("id");
                request.setAttribute("category", Category.readCategoryById(id));
            }
            request.getRequestDispatcher("./pages/index.jsp?page=edit-category").forward(request, response);
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
            String url = "list-category";
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            if(request.getParameter("mode") != null && request.getParameter("mode").equals("u"))
            {
                url = url + "?mode=u";
                String id = request.getParameter("id");
                url = url + "&id=" + id;
                Category.updateCategoryById(name, description, id);
            }
            else
            {
                Category.createCategory(name, description);
            }
            response.sendRedirect(url);
        }
        catch(Exception err)
        {
            err.printStackTrace(response.getWriter());
        }
    }
    
}
