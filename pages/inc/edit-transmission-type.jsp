<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    TransmissionType transmission = new TransmissionType("", "", "");
    if(request.getAttribute("transmission-type") != null){
        transmission = (TransmissionType)request.getAttribute("transmission-type");
    }
%>

<main class="main-content" id="main-content">
    <% if(request.getAttribute("transmission-type") != null){ %>
        <h1 class="title">Update TransmissionType</h1>
    <% }else{ %>
        <h1 class="title">New TransmissionType</h1>
    <% } %>
    <form action="./list-transmission-type" method="post" id="login-form" class="form" style="width: 40%;">
        <% if(request.getAttribute("transmission-type") != null){ %>
            <input type="hidden" name="mode" value="u">
            <input type="hidden" name="id" value="<%= transmission.getId() %>">
        <% } %>
        <div class="form__content">
            <div class="form__input vertical">
                <label for="name" class="form__label">Name:</label>
    
                <input type="text" name="name" id="name" class="form__input-field" value="<%= transmission.getName() %>"/>
            </div>
    
            <div class="form__input vertical">
                <label for="nom" class="form__label">Description:</label>
    
                <textarea name="description" id="description" cols="20" rows="10" class="form__input-field">
                    <%= transmission.getDescription() %>
                </textarea>
            </div>
    
        </div>
        <input type="submit" value="Submit" class="form__submit btn" />
    </form>
</main>