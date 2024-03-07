<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    String scroll = request.getParameter("scroll");
    ArrayList<Car> cars = (ArrayList<Car>)request.getAttribute("cars");
    HashMap<String, HashMap<String, String>> infos = (HashMap<String, HashMap<String, String>>)request.getAttribute("infos");
%>

<div class="links">
    <link rel="stylesheet" href="./assets/css/caroussel.css">
    <link rel="stylesheet" href="./assets/css/caroussel-card.css">
    <link rel="stylesheet" href="./assets/css/mini-card.css">
    <link rel="stylesheet" href="./assets/css/details-card.css">
</div>

<main class="main-content" id="main-content">
    <h1 class="title">Cars</h1>
    <jsp:include page = "search-form.jsp" />
    <% if(session.getAttribute("user") != null){ %>
        <a href="./edit-car">New Car</a>
    <% } %>
    <div class="container">
        <% for(Car car : cars) { %>

            <div class="mini-card">
                <h2 class="mini-card__title">
                    <%= car.getName() %>
                </h2>
                <p class="mini-card__detail">
                    <%= car.getYear() %>
                </p>
                <button class="mini-card__detail-btn">Detail</button>
            </div>

        <% } %>
    </div>
    <div class="card-container" id="card-container">
        <% for(Car car : cars) { HashMap<String, String> info = infos.get(car.getId());%>

            <div class="wrapper">
                <div class="details-card hidden">
                    <div class="details-card__image">
                        <img src="./assets/images/cars/<%= info.get("brand") %>/<%= car.getImage() %>" alt="" class="caroussel-card__image">
                    </div>
                    <div class="details-card__details">
                        <div class="details-card__title">
                            <h2><%= car.getName() %></h2>
                        </div>
                        <div class="details-card__section">
                            <p><%= car.getYear() %></p>
                            <p><%= car.getSeatingCapacity() %> seat(s)</p>
                        </div>
                        <div class="details-card__price">
                            <h1>$<%= car.getPrice() %></h1>
                        </div>
                        <div class="details-card__info">
                            <div class="details-card__section group">
                                <h4 class="group__label">Category:</h4>
                                <p class="group__content"><%= info.get("category") %></p>
                            </div>
                            <div class="details-card__section group">
                                <h4 class="group__label">Transmission:</h4>
                                <p class="group__content"><%= info.get("transmission_type") %></p>
                            </div>
                            <div class="details-card__section group">
                                <h4 class="group__label">Engine:</h4>
                                <p class="group__content"><%= info.get("engine_type") %></p>
                            </div>
                        </div>
                        <% if(session.getAttribute("user") != null){ %>
                            <div class="details-card__btn">
                                <a href="./edit-car?mode=u&id=<%= car.getId() %>" class="details-card__edit"><i class="fa fa-edit"></i>Edit</a>
                                <a href="./list-car?mode=d&id=<%= car.getId() %>" class="details-card__delete"><i class="fa fa-trash"></i>Delete</a>
                            </div>
                        <% } %>
                        <button class="detail-card__close"><i class="fa fa-x"></i></button>
                    </div>
                </div>
            </div>

        <% } %>
    </div>
</main>
<script src="./assets/js/card.js"></script>
<script src="./assets/js/caroussel.js"></script>

