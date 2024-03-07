<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    ArrayList<TransmissionType> transmissions = (ArrayList<TransmissionType>)request.getAttribute("transmission-types");
%>

<main class="main-content" id="main-content">
    <h1 class="title">TransmissionType</h1>
    <% if(session.getAttribute("user") != null){ %>
        <a href="./edit-transmission-type">New TransmissionType</a>
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
            <% for(TransmissionType transmission: transmissions){ %>
                <tr>
                    <td class="id"><%= transmission.getId() %></td>
                    <td class="name"><%= transmission.getName() %></td>
                    <td class="name"><%= transmission.getDescription() %></td>
                    <% if(session.getAttribute("user") != null){ %>
                        <td class="name action"><a style="color: green;" href="./edit-transmission-type?mode=u&id=<%= transmission.getId() %>"><i class="fa fa-pen"></i>Edit</a></td>
                        <td class="name action"><a style="color: red" href="./list-transmission-type?mode=d&id=<%= transmission.getId() %>"><i class="fa fa-trash"></i>Delete</a></td>
                    <% } %>
                </tr>
                <% } %>
        </table>
    </div>
</main>