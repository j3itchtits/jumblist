﻿<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Index</title>
</head>
<body>
    <div>

    <h2><%= Html.PageTitle( ViewData.Model )%></h2>

    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>
        
    <p>Sent! Check inbox.</p>

    </div>
</body>
</html>
