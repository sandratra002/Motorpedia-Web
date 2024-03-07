<%@page import = "java.util.*" %>
<%@page import = "model.*" %>

<%
    String currentPage = request.getParameter("page");
    if(currentPage == null){
        currentPage = "list-car";
    }
    currentPage = "inc/" + currentPage + ".jsp";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Motorpedia | Car</title>

    <!-- CSS Stylesheet -->
    <link rel="stylesheet" href="./assets/css/index.css">
    <link rel="stylesheet" href="./assets/css/header.css">
    <link rel="stylesheet" href="./assets/css/form.css">
    <link rel="stylesheet" href="./assets/css/image-selector.css">
    <link rel="stylesheet" href="./assets/css/table.css">
    <link rel="stylesheet" href="./assets/css/footer.css">

    <!-- Libraries -->
    <link rel="stylesheet" href="./assets/icons/fontawesome-free-6.4.2-web/css/all.css">
    <link rel="stylesheet" href="./assets/icons/fontawesome-free-6.4.2-web/css/fontawesome.css">
</head>
<body class="">
    <div class="white-bg"></div>
    <jsp:include page = "shared/header.jsp" />
    
    <jsp:include page = "<%= currentPage %>" />   
</body>
<% if(request.getParameter("mode") != null && request.getParameter("mode").equals("s")){ %>
        
    <script>
            let container = document.getElementById("card-container");
            window.scroll(0, container.offsetTop);
    </script>
    
<% } %>
</html>