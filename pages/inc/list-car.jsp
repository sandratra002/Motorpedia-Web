<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    ArrayList<Car> cars = (ArrayList<Car>)request.getAttribute("cars");
    HashMap<String, HashMap<String, String>> infos = (HashMap<String, HashMap<String, String>>)request.getAttribute("infos");
%>

<div class="caroussel">
    <div class="caroussel__wrapper">
<% for(int i = 0; i < 5; i++){ Car car = cars.get(i); HashMap<String, String> info = infos.get(car.getId());  %>
        <div class="caroussel-card caroussel__card">
            <!-- <div class="caroussel-card__title">
                <h1><%= car.getName() %></h1>
            </div> -->
            <!-- <div class="caroussel-card__price">
                <p>From $<%= car.getPrice() %>*</p>
            </div> -->
            <img src="./assets/images/cars/<%= info.get("brand") %>/<%= car.getImage() %>" alt="" class="caroussel-card__image">
            <button href="#" class="caroussel-card__link-btn">Details</button>
        </div>
<%  } %>
</div>
<button class="caroussel__btn prev-btn"><i class="fa fa-angle-left"></i></button>
<button class="caroussel__btn next-btn"><i class="fa fa-angle-right"></i></button>
</div>