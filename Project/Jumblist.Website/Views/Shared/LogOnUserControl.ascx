<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

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


