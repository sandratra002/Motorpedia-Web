<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    Category category = new Category("", "", "");
    if(request.getAttribute("category") != null){
        category = (Category)request.getAttribute("category");
    }
%>

<main class="main-content" id="main-content">
    <% if(request.getAttribute("car") != null){ %>
        <h1 class="title">Update Category</h1>
    <% }else{ %>
        <h1 class="title">New Category</h1>
    <% } %>
    <form action="./list-category" method="post" id="login-form" class="form" style="width: 40%;">
        <% if(request.getAttribute("category") != null){ %>
            <input type="hidden" name="mode" value="u">
            <input type="hidden" name="id" value="<%= category.getId() %>">
        <% } %>
        <div class="form__content">
            <div class="form__input vertical">
                <label for="name" class="form__label">Name:</label>
    
                <input type="text" name="name" id="name" class="form__input-field" value="<%= category.getName() %>"/>
            </div>
    
            <div class="form__input vertical">
                <label for="nom" class="form__label">Description:</label>
    
                <textarea name="description" id="description" cols="20" rows="10" class="form__input-field">
                    <%= category.getDescription() %>
                </textarea>
            </div>
    
        </div>
        <input type="submit" value="Submit" class="form__submit btn" />
    </form>
</main>