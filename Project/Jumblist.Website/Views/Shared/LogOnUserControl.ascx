<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Welcome <b><%= Html.RouteLink( Html.Encode( Page.User.Identity.Name ), "Admin", new { controller = "admin", action = "index" } )%></b>!
        [ <%= Html.RouteLink( "Log Out", "Default-OneParameter", new { controller = "account", action = "logout" } )%> ]
<%
    }
    else {
%> 
        [ <%= Html.RouteLink( "Login", "Default-OneParameter", new { controller = "account", action = "login", returnurl = Request.Url.PathAndQuery } )%> ]
<%
    }
%>

