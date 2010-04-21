<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<User>" %>

<%

    if (Model.IsAuthenticated)
    {
        %> Welcome <b><%= Model.Name %></b>! [ <%= Html.LogoutLink( "Log Out" )%> ] | <%
        
        //we need to have the admin link here - see the bottom of the page for some sample code
        if ( Model.Role.UserCanAccessAdminArea ) 
        { 
            %> [ <%= Html.ActionLink( "Admin", "Index", new { area = "Admin", controller = "Home" } ) %> ] <% 
        }
    }
    else
    { 
        %> [ <%= Html.LoginLink( "Log In", Page.Request.Url.PathAndQuery ) %> ]
        [ <%= Html.RegisterLink( "Register", Page.Request.Url.PathAndQuery ) %> ] <%
    }
 
%>