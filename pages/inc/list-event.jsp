<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    ArrayList<Event> events = (ArrayList<Event>) request.getAttribute("events");
%>

<main class="main-content" id="main-content">
    <h1 class="title">Event</h1>
    <% if(session.getAttribute("user") != null){ %>
        <a href="./edit-event">New Event</a>
    <% } %>
    <div class="container">
        <% for (Event event : events) { %>
            <div class="event-card">
                <p><%= event.getName() %></p>
                <p><%= event.getDescription() %></p>
                <p><%= event.getHashtag() %></p>
                <p><%= event.getEventDate() %></p>
                <% if(session.getAttribute("user") != null){ %>
                    <a href="./edit-event?mode=u&id=<%= event.getId() %>">Edit</a>
                    <a href="./list-event?mode=d&id=<%= event.getId() %>">Delete</a>
                <% } %>
            </div>
        <% } %>
    </div>
</main>