package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Category;

public class ListCategory extends HttpServlet
{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            if(request.getParameter("mode") != null && request.getParameter("mode").equals("d"))
            {
                String id = request.getParameter("id");
                Category.deleteCategoryById(id);
            }
            request.setAttribute("categorys", Category.readCategory());
            request.getRequestDispatcher("list-category.jsp").forward(request, response);
        }
        catch(Exception err)
        {
            err.printStackTrace(response.getWriter());
        }
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    }
    
}
