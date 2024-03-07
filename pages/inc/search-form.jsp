<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    HashMap<String, Object> searchMap = (HashMap<String, Object>)request.getAttribute("search-map");
    ArrayList<EngineType> engines = (ArrayList<EngineType>)request.getAttribute("engine-type");
    ArrayList<TransmissionType> transmissions = (ArrayList<TransmissionType>) request.getAttribute("transmission-type");
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("category");
    ArrayList<Brand> brands = (ArrayList<Brand>) request.getAttribute("brand");
%>

<form action="./list-car" method="get" id="form" class="form" style="width: 50%;">
    <input type="hidden" name="mode" value="s">
    <h1 class="form__title">
        Filter
    </h1>
    <div class="form__content">

        <div class="form__input-group horizontal">
            <div class="form__input vertical">
                <label for="name" class="form__label">Name:</label>
    
                <input type="text" min="1" max="5" name="name" id="name" class="form__input-field" value="<%= searchMap.get("name") %>"/>
            </div>
    
            <div class="form__input vertical">
                <label for="year" class="form__label">Year:</label>
    
                <input type="number" name="year" id="year" class="form__input-field" value="<%= searchMap.get("year") %>"/>
            </div>
    
            <div class="form__input vertical">
                <label for="brand" class="form__label">Brand:</label>
    
                <select name="brand" id="" class="form__input-field">
                    <option value=""></option>
                    <% for(Brand brand : brands) { %>
                        <% if(brand.getId().equals(searchMap.get("brand"))){ %>
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
                <label for="transmission-type" class="form__label">Transmission:</label>
    
                <select name="transmission-type" id="" class="form__input-field">
                    <option value=""></option>
                    <% for(TransmissionType trans : transmissions) { %>
                        <% if(trans.getId().equals(searchMap.get("transmission-type"))){ %>
                            <option value="<%= trans.getId() %>" selected><%= trans.getName() %></option>
                        <% }else{ %>
                            <option value="<%= trans.getId() %>"><%= trans.getName() %></option>
                        <% } %>
                    <% } %>
                </select>
            </div>
    
            <div class="form__input vertical">
                <label for="engine-type" class="form__label">Engine:</label>
    
                <select name="engine-type" id="" class="form__input-field">
                    <option value=""></option>
                    <% for(EngineType engine : engines){ %>
                        <% if(engine.getId().equals(searchMap.get("engine-type"))){ %>
                            <option value="<%= engine.getId() %>" selected><%= engine.getName() %></option>
                        <% }else{ %>
                            <option value="<%= engine.getId() %>"><%= engine.getName() %></option>
                        <% } %>
                    <% } %>
                </select>
            </div>
    
            <div class="form__input vertical">
                <label for="category" class="form__label">Category:</label>
    
                <select name="category" id="" class="form__input-field">
                    <option value=""></option>
                    <% for(Category category : categories){ %>
                        <% if(category.getId().equals(searchMap.get("category"))){ %>
                            <option value="<%= category.getId() %>" selected><%= category.getName() %></option>
                        <% }else{ %>
                            <option value="<%= category.getId() %>"><%= category.getName() %></option>
                        <% } %>
                    <% } %>
                </select>
            </div>
        </div>
        
        <div class="form__input-group horizontal">
            <div class="form__input vertical">
                <label for="max-price" class="form__label">Max Price:</label>
    
                <input type="number" name="max-price" id="max-price" class="form__input-field" value="<%= searchMap.get("max-price") %>"/>
            </div>
    
            <div class="form__input vertical">
                <label for="min-price" class="form__label">Min Price:</label>
    
                <input type="number" name="min-price" id="min-price" class="form__input-field" value="<%= searchMap.get("min-price") %>"/>
            </div>
    
            <div class="form__input vertical">
                <label for="seating-capacity" class="form__label">Seating Capacity:</label>
    
                <input type="number" name="seating-capacity" id="seating-capacity" class="form__input-field" value="<%= searchMap.get("seating-capacity") %>"/>
            </div>
        </div>

    </div>
    <input type="submit" value="Filter" class="form__submit btn" />
</form>