<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    ArrayList<Brand> brands = (ArrayList<Brand>)request.getAttribute("brands");
    ArrayList<Category> categories = (ArrayList<Category>)request.getAttribute("categories");
    ArrayList<TransmissionType> transmissions = (ArrayList<TransmissionType>)request.getAttribute("transmissions");
    ArrayList<EngineType> engines = (ArrayList<EngineType>)request.getAttribute("engines");
    Car usedCar = new Car("", "", 2024, 0, 0, "", "", "", "", "");
    if(request.getAttribute("car") != null){
        usedCar = (Car)request.getAttribute("car");
    }
    HashMap<String, String> info = (HashMap<String, String>) request.getAttribute("info");

%>
<main class="main-content" id="main-content">
    <% if(request.getAttribute("car") != null){ %>
        <h1 class="title">Update Car</h1>
    <% }else{ %>
        <h1 class="title">New Car</h1>
    <% } %>
<form action="./edit-car" method="post" id="login-form" class="form" enctype="multipart/form-data">
    <div class="form__layout">
        <div class="form__section image-selector">
            <label class="image-selector__label" for="image"><i class="fa fa-camera"></i></label>
            <input type="file" class="image-selector__input" name="image" id="image" style="display: none;">
            <div class="image-selector__preview">
                <img src="./assets/images/cars/<%= info.get("brand") %>/<%= usedCar.getImage() %>" alt="Car Image">
            </div>  
        </div>
        <% if(request.getAttribute("car") != null){ %>
            <input type="hidden" name="mode" value="u">
            <input type="hidden" name="id" value="<%= usedCar.getId() %>">
            <input type="hidden" id="image-name"  name="image-name" value="<%= usedCar.getImage() %>">
        <% } %>
        <div class="form__section">

            <div class="form__content">
                <div class="form__input-group horizontal">
                    <div class="form__input vertical">
                        <label for="name" class="form__label">Name:</label>
    
                        <input type="text" name="name" id="name" class="form__input-field" value="<%= usedCar.getName()%>"/>
                    </div>
                    <div class="form__input vertical">
                        <label for="brand-id" class="form__label">Brand:</label>

                        <select name="brand-id" id="" class="form__input-field">
                            <option value=""></option>
                            <% for(Brand brand : brands) { %>
                                <% if(brand.getId().equals(usedCar.getBrandId())){ %>
                                    <option value="<%= brand.getId() %>" selected><%= brand.getName() %></option>
                                <% }else{ %>
                                    <option value="<%= brand.getId() %>"><%= brand.getName() %></option>
                                <% } %>
                            <% } %>
                        </select>
                    </div>
                </div>

                <div class="form__input-group horizontal">
                    <div class="form__input vertical">
                        <label for="year" class="form__label">Year:</label>

                        <input type="number" name="year" id="year" class="form__input-field" value="<%= usedCar.getYear()%>">
                    </div>
                    <div class="form__input vertical">
                        <label for="seating-capacity" class="form__label">Seating:</label>

                        <input type="number" name="seating-capacity" id="seating-capacity" class="form__input-field" value="<%= usedCar.getSeatingCapacity()%>">
                    </div>
                </div>

                <div class="form__input vertical">
                    <label for="price" class="form__label">Price:</label>

                    <div>
                        <input type="number" name="price" id="price" class="form__input-field" value="<%= usedCar.getPrice()%>">
                        <span class="form__input-field unit">$</span>
                    </div>
                </div>

                <div class="form__input-group horizontal">
                    <div class="form__input vertical">
                        <label for="category-id" class="form__label">Category:</label>

                        <select name="category-id" id="category-id" class="form__input-field">
                            <option value=""></option>
                            <% for(Category category : categories) { %>
                                <% if(category.getId().equals(usedCar.getCategoryId())){ %>
                                    <option value="<%= category.getId() %>" selected><%= category.getName() %></option>
                                <% }else{ %>
                                    <option value="<%= category.getId() %>"><%= category.getName() %></option>
                                <% } %>
                            <% } %>
                        </select>
                    </div>
                    <div class="form__input vertical">
                        <label for="transmission-type-id" class="form__label">Transmission:</label>

                        <select name="transmission-type-id" id="transmission-type-id" class="form__input-field">
                            <option value=""></option>
                            <% for(TransmissionType transmission : transmissions) { %>
                                <% if(transmission.getId().equals(usedCar.getTransmissionTypeId())){ %>
                                    <option value="<%= transmission.getId() %>" selected><%= transmission.getName() %></option>
                                <% }else{ %>
                                    <option value="<%= transmission.getId() %>"><%= transmission.getName() %></option>
                                <% } %>
                            <% } %>
                        </select>
                    </div>
                    <div class="form__input vertical">
                        <label for="engine-type-id" class="form__label">Engine:</label>

                        <select name="engine-type-id" id="engine-type-id" class="form__input-field">
                            <option value=""></option>
                            <% for(EngineType engine : engines) { %>
                                <% if(engine.getId().equals(usedCar.getEngineTypeId())){ %>
                                    <option value="<%= engine.getId() %>" selected><%= engine.getName() %></option>
                                <% }else{ %>
                                    <option value="<%= engine.getId() %>"><%= engine.getName() %></option>
                                <% } %>
                            <% } %>
                        </select>
                    </div>
                </div>

                <!-- <input type="submit" value="Inserer" class="form__submit btn" />4 -->
                <button type="submit" class="form__submit btn">Submit</button>
            </div>

        </div>
    </div>
</form>
</main>
<script src="./assets/js/image.js"></script>