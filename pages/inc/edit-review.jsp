<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    Review review = new Review("", "", "", "", 1);
    ArrayList<UserInfo> users = (ArrayList<UserInfo>) request.getAttribute("users");
    ArrayList<Car> cars = (ArrayList<Car>) request.getAttribute("cars");
    if(request.getAttribute("review") != null){
        review = (Review)request.getAttribute("review");
    }
%>

<main class="main-content" id="main-content">
    <% if(request.getAttribute("review") != null){ %>
        <h1 class="title">Update Review</h1>
    <% }else{ %>
        <%= request.getAttribute("review") %>
        <h1 class="title">New Review</h1>
    <% } %>
    <form action="./list-review" method="post" id="login-form" class="form" style="width: 40%;">
        <% if(request.getAttribute("review") != null){ %>
            <input type="hidden" name="mode" value="u">
            <input type="hidden" name="id" value="<%= review.getId() %>">
        <% } %>
        <div class="form__content">
            <div class="form__input vertical">
                <label for="user-id" class="form__label">User:</label>

                <select name="user-id" id="" class="form__input-field">
                    <option value=""></option>
                    <% for(UserInfo user : users) { %>
                        <% if(user.getId().equals(review.getUserId())){ %>
                            <option value="<%= user.getId() %>" selected><%= user.getName() %></option>
                        <% }else{ %>
                            <option value="<%= user.getId() %>"><%= user.getName() %></option>
                        <% } %>
                    <% } %>
                </select>
            </div>

            <div class="form__input vertical">
                <label for="car-id" class="form__label">Car:</label>

                <select name="car-id" id="" class="form__input-field">
                    <option value=""></option>
                    <% for(Car car : cars) { %>
                        <% if(car.getId().equals(review.getCarId())){ %>
                            <option value="<%= car.getId() %>" selected><%= car.getName() %></option>
                        <% }else{ %>
                            <option value="<%= car.getId() %>"><%= car.getName() %></option>
                        <% } %>
                    <% } %>
                </select>
            </div>
    
            <div class="form__input vertical">
                <label for="review" class="form__label">Review:</label>
    
                <textarea name="review" id="review" cols="20" rows="10" class="form__input-field">
                    <%= review.getReview() %>
                </textarea>
            </div>
    
            <div class="form__input vertical">
                <label for="rating" class="form__label">Rating:</label>
    
                <input type="number" min="1" max="5" name="rating" id="rating" class="form__input-field" value="<%= review.getRating() %>"/>
            </div>

        </div>
        <input type="submit" value="Submit" class="form__submit btn" />
    </form>
</main>