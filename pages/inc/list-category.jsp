<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    ArrayList<Category> categories = (ArrayList<Category>)request.getAttribute("categories");
%>

<main class="main-content" id="main-content">
    <h1 class="title">Category</h1>
    <a href="./edit-category">New Category</a>
    <div class="container">
        <table>
            <tr>
                <th class="id">Id</th>
                <th class="name">Name</th>
                <th class="name">Description</th>
                <th>Action</th>
                <th>Action</th>
            </tr>
            <% for(Category category : categories){ %>
                <tr>
                    <td class="id"><%= category.getId() %></td>
                    <td class="name"><%= category.getName() %></td>
                    <td class="name"><%= category.getDescription() %></td>
                    <td class="name action"><a style="color: green;" href="./edit-category?mode=u&id=<%= category.getId() %>"><i class="fa fa-pen"></i>Edit</a></td>
                    <td class="name action"><a style="color: red" href="./list-category?mode=d&id=<%= category.getId() %>"><i class="fa fa-trash"></i>Delete</a></td>
                </tr>
                <% } %>
        </table>
    </div>
</main>