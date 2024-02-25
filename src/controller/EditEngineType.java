package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.EngineType;

public class EditEngineType extends HttpServlet
{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            if(request.getParameter("mode") != null && request.getParameter("mode").equals("u"))
            {
                String id = request.getParameter("id");
                request.setAttribute("engine", EngineType.readEngineTypeById(id));
            }
            request.getRequestDispatcher("./pages/index.jsp?page=edit-engine-type").forward(request, response);
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
            String url = "list-engine-type";
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            if(request.getParameter("mode") != null && request.getParameter("mode").equals("u"))
            {
                url = url + "?mode=u";
                String id = request.getParameter("id");
                url = url + "&id=" + id;
                EngineType.updateEngineTypeById(name, description, id);
            }
            else
            {
                EngineType.createEngineType(name, description);
            }
            response.sendRedirect(url);
        }
        catch(Exception err)
        {
            err.printStackTrace(response.getWriter());
        }
    }
    
}
