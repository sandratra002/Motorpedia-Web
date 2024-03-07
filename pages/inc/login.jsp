<%@page import = "java.util.*" %>

<%

    HashMap<String, String> map = (HashMap<String, String>)request.getAttribute("form-map");
%>

<div class="form-container enabled">
    <div class="btn-container">
        <button class="btn disabled login-btn">Login</button>
        <button class="btn enabled signup-btn">SignUp</button>
    </div>
    <div class="form-wrapper">
        <form action="./login" class="form disabled" method="post" id="login-form">
            <h1 class="form__title">Login</h1>

            <hr class="form__sep">

            <div class="form__content">
                <div class="form__input vertical">
                    <label for="login-email" class="form__label">Email:</label>

                    <input type="email" name="email" id="login-email" class="form__input-field" value="<%= map.get("email") %>" placeholder="example@gmail.com"/>
                </div>

                <div class="form__input vertical">
                    <label for="login-password" class="form__label">Password:</label>

                    <input type="password" name="password" id="login-password" class="form__input-field" value="<%= map.get("password") %>" placeholder=""/>
                </div>
            </div>
            <input type="hidden" name="page" value="<%= request.getContextPath() %>">
            <input type="hidden" name="mode" value="login">

            <% if(request.getAttribute("error") != null && request.getAttribute("mode").equals("login")){ %>
                <p class="form__error"><%= request.getAttribute("error") %></p>
            <% } %>

            <input type="submit" value="Submit" class="form__submit btn" />
        </form>
        <form action="./login" class="form enabled" method="post" id="signup-form">
            <h1 class="form__title">Signup</h1>

            <hr class="form__sep">

            <div class="form__content">
                <div class="form__input-group horizontal">
                    <div class="form__input vertical">
                        <label for="name" class="form__label">Name:</label>
    
                        <input type="text" name="name" id="name" class="form__input-field" value="<%= map.get("name") %>" placeholder=""/>
                    </div>
                    <div class="form__input vertical">
                        <label for="first-name" class="form__label">First name:</label>
    
                        <input type="text" name="first-name" id="first-name" class="form__input-field" value="<%= map.get("first-name") %>" placeholder=""/>
                    </div>
                </div>
                <div class="form__input vertical">
                    <label for="signup-email" class="form__label">Email:</label>

                    <input type="email" name="email" id="signup-email" class="form__input-field" value="<%= map.get("email") %>" placeholder="example@gmail.com"/>
                </div>

                <div class="form__input-group horizontal">
                    <div class="form__input vertical">
                        <label for="password" class="form__label">Password:</label>

                        <input type="password" name="password" id="password" class="form__input-field" value="<%= map.get("password") %>" placeholder=""/>
                    </div>
                    <div class="form__input vertical">
                        <label for="confirm-password" class="form__label">Confirm Password:</label>

                        <input type="password" name="confirm-password" id="confirm-password" class="form__input-field" value="<%= map.get("confirm-password") %>" placeholder=""/>
                    </div>
                </div>
                <input type="hidden" name="page" value="<%= request.getContextPath() %>">
                <input type="hidden" name="mode" value="signup">
            </div>
            <% if(request.getAttribute("error") != null && request.getAttribute("mode").equals("signup")){ %>
                <p class="form__error"><%= request.getAttribute("error") %></p>
            <% } %>
            <input type="submit" value="Submit" class="form__submit btn" />
        </form>
    </div>
</div>
<script src="./assets/js/form.js"></script>
<script>
    let enabled = localStorage.getItem("enabled");
    if(enabled == "login") login();
    else signup();
</script>