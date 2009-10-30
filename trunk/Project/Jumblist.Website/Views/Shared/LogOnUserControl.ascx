<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Welcome <b><%= Html.Encode(Page.User.Identity.Name) %></b>!
        [ <%= Html.RouteLink( "Log Out", "default", new { controller = "users", action = "logout" } ) %> ]
<%
    }
    else {
%> 
        [ <%= Html.RouteLink( "Login", "default", new { controller = "users", action = "login", returnurl = HttpContext.Current.Request.Url.PathAndQuery } ) %> ]
<%
    }
%>

