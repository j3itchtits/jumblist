<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DefaultViewModel<User>>" %>

<%

    if (Page.User.Identity.IsAuthenticated)
    { %>
        Welcome <b><%= Model.Item.Name %></b>!
        [ <%= Html.LogoutLink( "Log Out" )%> ] | <%
        
        //we need to have the admin link here - see the bottom of the page for some sample code

    }
    else
    { %>
        [ <%= Html.LoginLink( "Log In", Page.Request.Url.PathAndQuery ) %> ]
        [ <%= Html.RegisterLink( "Register", Page.Request.Url.PathAndQuery ) %> ]    <%
    }
 
%>

<%--        <% if ( Model.Item.Role.UserCanAccessAdminArea ) { %>
               [ <%= Html.ActionLink( "Admin", "Index", new { area = "Admin", controller = "Home" } ) %> ]
        <% } --%>