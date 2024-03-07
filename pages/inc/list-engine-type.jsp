<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    ArrayList<EngineType> engines = (ArrayList<EngineType>)request.getAttribute("engine-types");
%>

<main class="main-content" id="main-content">
    <h1 class="title">EngineType</h1>
    <% if(session.getAttribute("user") != null){ %>
        <a href="./edit-engine-type">New EngineType</a>
    <% } %>
    <div class="container">
        <table>
            <tr>
                <th class="id">Id</th>
                <th class="name">Name</th>
                <th class="name">Description</th>
                <th>Action</th>
                <th>Action</th>
            </tr>
            <% for(EngineType engine : engines){ %>
                <tr>
                    <td class="id"><%= engine.getId() %></td>
                    <td class="name"><%= engine.getName() %></td>
                    <td class="name"><%= engine.getDescription() %></td>
                    <% if(session.getAttribute("user") != null){ %>
                        <td class="name action"><a style="color: green;" href="./edit-engine-type?mode=u&id=<%= engine.getId() %>"><i class="fa fa-pen"></i>Edit</a></td>
                        <td class="name action"><a style="color: red" href="./list-engine-type?mode=d&id=<%= engine.getId() %>"><i class="fa fa-trash"></i>Delete</a></td>
                    <% } %>
                </tr>
                <% } %>
        </table>
    </div>
</main>