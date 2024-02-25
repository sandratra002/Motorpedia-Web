package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.TransmissionType;

public class EditTransmissionType extends HttpServlet
{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            if(request.getParameter("mode") != null && request.getParameter("mode").equals("u"))
            {
                String id = request.getParameter("id");
                request.setAttribute("transmission-type", TransmissionType.readTransmissionTypeById(id));
            }
            request.getRequestDispatcher("./pages/index.jsp?page=edit-transmission-type").forward(request, response);
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
            String url = "list-transmission-type";
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            if(request.getParameter("mode") != null && request.getParameter("mode").equals("u"))
            {
                url = url + "?mode=u";
                String id = request.getParameter("id");
                url = url + "&id=" + id;
                TransmissionType.updateTransmissionTypeById(name, description, id);
            }
            else
            {
                TransmissionType.createTransmissionType(name, description);
            }
            response.sendRedirect(url);
        }
        catch(Exception err)
        {
            err.printStackTrace(response.getWriter());
        }
    }
    
}
