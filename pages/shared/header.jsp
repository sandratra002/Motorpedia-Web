<!-- <jsp:include page = "form.jsp" /> -->
<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    UserInfo user = new UserInfo("", "Guest", "Guest", "guest@gmail.cimom", "");
    if(session.getAttribute("user") != null){
        user = (UserInfo)session.getAttribute("user");
    }    
    String type = session.getAttribute("user") != null ? "Admin" : "Guest";
%>
<header class="header">
    <div class="header__logo">
        <h1><a href="#">MotorPedia</a></h1>
    </div>
    
    <div class="header__section">
        <nav class="heaver__nav nav">
            <ul class="">
                <li class="nav__item">
                    <a href="./list-car">Home</a>
                </li>
                <li class="nav__item">
                    <a href="./list-brand">Brand</a>
                </li>
                <li class="nav__item">
                    <a href="./list-review">Review</a>
                </li>
                <li class="nav__item">
                    <a href="./list-event">Events</a>
                </li>
                <% if(session.getAttribute("user") != null){ %>
                    <li class="nav__item">
                        <a href="./logout">Logout</a>
                    </li>
                <% }else{ %>
                    <li class="nav__item">
                        <a href="./login">Login</a>
                    </li>
                <% } %>
            </ul>
        </nav>

        <div class="vertical_separator"></div>

        <div class="header__profile profile">
            <div class="profile__image">
                <img src="./assets/images/profile-image.jpg" alt="Profile Pic">
                <!-- <div class="profile__status"></div> -->
            </div>

            <div class="profile__details">
                <span class="profile__uid"><%= user.getName() %></span>
                <span class="profile__type"><%= type %></span>
            </div>
        </div>
    </div>

</header>