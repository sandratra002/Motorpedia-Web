<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    ArrayList<String> countries = (ArrayList<String>)request.getAttribute("countries");
    Brand usedBrand = new Brand("", "", "", "");
    if(request.getAttribute("brand") != null){
        usedBrand = (Brand)request.getAttribute("brand");
    }
%>
<main class="main-content" id="main-content">
    <% if(request.getAttribute("car") != null){ %>
        <h1 class="title">Update Brand</h1>
    <% }else{ %>
        <h1 class="title">New Brand</h1>
    <% } %>
<form action="./edit-brand" method="post" id="login-form" class="form" enctype="multipart/form-data">
    <div class="form__layout">
        <div class="form__section image-selector">
            <label class="image-selector__label" for="image"><i class="fa fa-camera"></i></label>
            <input type="file" class="image-selector__input" name="logo" id="image" style="display: none;">
            <div class="image-selector__preview">
                <img src="./assets/images/logo/<%= usedBrand.getLogo() %>" alt="Brand Image">
            </div>  
        </div>
        <% if(request.getAttribute("brand") != null){ %>
            <input type="hidden" name="mode" value="u">
            <input type="hidden" name="id" value="<%= usedBrand.getId() %>">
            <input type="hidden" id="image-name"  name="image-name" value="<%= usedBrand.getLogo() %>">
        <% } %>
        <div class="form__section">

            <div class="form__content">
                <div class="form__input-group horizontal">
                    <div class="form__input vertical">
                        <label for="name" class="form__label">Name:</label>
    
                        <input type="text" name="name" id="name" class="form__input-field" value="<%= usedBrand.getName()%>"/>
                    </div>
                </div>
                <div class="form__input-group horizontal">
                    <div class="form__input vertical">
                        <label for="origin-country" class="form__label">Country:</label>

                        <select name="origin-country" id="origin-country" class="form__input-field">
                            <option value=""></option>
                            <% for(String country : countries) { %>
                                <% if(country.equals(usedBrand.getOriginCountry())){ %>
                                    <option value="<%= country %>" selected><%= country %></option>
                                <% }else{ %>
                                    <option value="<%= country %>"><%= country %></option>
                                <% } %>
                            <% } %>
                        </select>
                    </div>
                </div>
                <button type="submit" class="form__submit btn">Submit</button>
            </div>
        </div>
    </div>
</form>
</main>
<script src="./assets/js/image.js"></script>