package controller;

import java.io.*;
import java.util.ArrayList;

import conf.ConfigInfo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Brand;

public class ListBrand extends HttpServlet
{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            if(request.getParameter("mode") != null && request.getParameter("mode").equals("d"))
            {
                String id = request.getParameter("id");
                Brand.deleteBrandById(id);
            }
            request.setAttribute("brands", Brand.readBrand());
            request.getRequestDispatcher("./pages/index.jsp?page=list-brand").forward(request, response);
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
