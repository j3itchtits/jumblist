<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<User>" %>

<%

    if (Model.IsAuthenticated)
    {
        %> Welcome <b><%= Html.ActionLink(Model.Name, "Profile")%></b>! <%= Html.LogoutLink( "[ Log Out ]" )%><%
        
        if ( Model.Role.UserCanAccessAdminArea ) 
        { 
            %> | <%= Html.ActionLink( "[ Admin ]", "Index", new { area = "Admin", controller = "Home" } ) %><%
        }
    }
    else
    { 
        %> [ <%= Html.LoginLink( "Log In", Page.Request.Url.PathAndQuery ) %> ]
        [ <%= Html.RegisterLink( "Register", Page.Request.Url.PathAndQuery ) %> ] <%
    }
 
%>