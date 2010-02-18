<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%
    if (!(ViewContext.Controller is UsersController))
    {
       Html.RenderAction( "LoginLinks", "Users", new { isAuthenticated = Page.Request.IsAuthenticated, name = Page.User.Identity.Name } );  
    } 
%>

<%--
<%
    if ( Page.Request.IsAuthenticated )
    {
%>
        Welcome <b><%= Html.Encode( Page.User.Identity.Name ) %></b>!
        [ <%= Html.LogoutLink( "Log Out" )%> ]
<%
    } else {
%> 
        [ <%= Html.LoginLink( "Log In", Page.Request.Url.PathAndQuery ) %> ]
        [ <%= Html.RegisterLink( "Register", Page.Request.Url.PathAndQuery ) %> ]        
<%
    }
%>
--%>

