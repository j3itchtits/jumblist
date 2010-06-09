<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%= ViewData["PageTitle"] %></title>
</head>
<body>
    <div>
        <h2><%= ViewData["PageTitle"]%></h2>
        
        <p><%= ViewData["Message"] %></p> 
        
        <p>You will need to contact the administrator if you think this is a mistake or <a href="/">return home</a>.</p> 
    </div>
</body>
</html>
