<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    ArrayList<Review> reviews = (ArrayList<Review>) request.getAttribute("reviews");
%>

<main class="main-content" id="main-content">
    <h1 class="title">Review</h1>
    <% if(session.getAttribute("user") != null){ %>
        <a href="./edit-review">New Review</a>
    <% } %>
    <div class="container">
        <% for (Review review : reviews) { %>
            <div class="review-card">
                <p><%= review.getReview() %></p>
                <p><%= review.getRating() %></p>
                <% if(session.getAttribute("user") != null){ %>
                    <a href="./edit-review?mode=u&id=<%= review.getId() %>">Edit</a>
                    <a href="./list-review?mode=d&id=<%= review.getId() %>">Delete</a>
                <% } %>
            </div>
        <% } %>
    </div>
</main>