<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    String scroll = request.getParameter("scroll");
    ArrayList<Brand> brands = (ArrayList<Brand>)request.getAttribute("brands");
%>

<div class="links">
    <link rel="stylesheet" href="./assets/css/logo-card.css">
</div>

<main id="main-content" class="main-content">
    <h1 class="title">Brands</h1>
    <a href="./edit-brand">New Brand</a>
    <div class="container">
    <% for(Brand brand : brands){ %>
        <div class="logo-card">
            <img src="./assets/images/logo/<%= brand.getLogo() %>" alt="" class="logo-card__image">
            <div class="logo-card__actions">
                <a href="./edit-brand?mode=u&id=<%= brand.getId() %>" class="logo-card__action"><i class="fa fa-pen"></i></a>
                <a href="./list-brand?mode=d&id=<%= brand.getId() %>" class="logo-card__action"><i class="fa fa-trash"></i></a>
            </div>
        </div>
        <% } %> 
    </div>
</main>