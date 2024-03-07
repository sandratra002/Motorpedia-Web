<%@page import = "java.util.*" %>
<%@page import = "java.sql.Date" %>
<%@page import = "model.*" %>

<%
    Event event = new Event("", "", "", "", Date.valueOf("2024-2-29"),"");
    ArrayList<Brand> brands = (ArrayList<Brand>) request.getAttribute("brands");
    if(request.getAttribute("event") != null){
        event = (Event)request.getAttribute("event");
    }
%>

<main class="main-content" id="main-content">
    <% if(request.getAttribute("event") != null){ %>
        <h1 class="title">Update Event</h1>
    <% }else{ %>
        <h1 class="title">New Event</h1>
    <% } %>
    <form action="./list-event" method="post" id="login-form" class="form" style="width: 40%;">
        <% if(request.getAttribute("event") != null){ %>
            <input type="hidden" name="mode" value="u">
            <input type="hidden" name="id" value="<%= event.getId() %>">
        <% } %>
        <div class="form__content">
            <div class="form__input vertical">
                <label for="name" class="form__label">Name:</label>
    
                <input type="text" min="1" max="5" name="name" id="name" class="form__input-field" value="<%= event.getName() %>"/>
            </div>

            <div class="form__input vertical">
                <label for="brand-id" class="form__label">Brand:</label>

                <select name="brand-id" id="" class="form__input-field">
                    <option value=""></option>
                    <% for(Brand brand : brands) { %>
                        <% if(brand.getId().equals(event.getBrandId())){ %>
                            <option value="<%= brand.getId() %>" selected><%= brand.getName() %></option>
                        <% }else{ %>
                            <option value="<%= brand.getId() %>"><%= brand.getName() %></option>
                        <% } %>
                    <% } %>
                </select>
            </div>
    
            <div class="form__input vertical">
                <label for="description" class="form__label">Description:</label>
    
                <textarea name="description" id="description" cols="20" rows="10" class="form__input-field">
                    <%= event.getDescription() %>
                </textarea>
            </div>

            <div class="form__input vertical">
                <label for="event-date" class="form__label">Date:</label>
    
                <input type="date" name="event-date" id="event-date" class="form__input-field" value="<%= event.getEventDate().toString() %>"/>
            </div>
    
            <div class="form__input vertical">
                <label for="hashtag" class="form__label">Hashtag:</label>
    
                <input type="text" name="hashtag" id="hashtag" class="form__input-field" value="<%= event.getHashtag() %>"/>
            </div>

        </div>
        <input type="submit" value="Submit" class="form__submit btn" />
    </form>
</main>