package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.TransmissionType;

public class ListTransmissionType extends HttpServlet
{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            if(request.getParameter("mode") != null && request.getParameter("mode").equals("d"))
            {
                String id = request.getParameter("id");
                TransmissionType.deleteTransmissionTypeById(id);
            }
            request.setAttribute("transmission-types", TransmissionType.readTransmissionType());
            request.getRequestDispatcher("list-transmission-type.jsp").forward(request, response);
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
