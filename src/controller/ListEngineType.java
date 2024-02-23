package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.EngineType;

public class ListEngineType extends HttpServlet
{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            if(request.getParameter("mode") != null && request.getParameter("mode").equals("d"))
            {
                String id = request.getParameter("id");
                EngineType.deleteEngineTypeById(id);
            }
            request.setAttribute("engine-types", EngineType.readEngineType());
            request.getRequestDispatcher("list-engine-type.jsp").forward(request, response);
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
