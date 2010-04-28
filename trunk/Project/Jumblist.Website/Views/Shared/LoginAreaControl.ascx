<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% 
    if (!(ViewContext.Controller is UsersController))
    { %>
        <div id="loginarea">
            <% Html.RenderAction("LoginLinks", "Users"); %>
        </div> <%
    } 
%>

<%--

        //Html.RenderAction( "LoginLinks_Alt", "Users", new { isAuthenticated = Page.Request.IsAuthenticated, name = Page.User.Identity.Name } );
        
        //Response.Write( "<br/>isAuthenticated: " + Page.User.Identity.IsAuthenticated + ", " + ((User)Page.User.Identity).IsAuthenticated + "<br/>" );
        //Response.Write( "name: " + Page.User.Identity.Name + ", " + ((User)Page.User.Identity).Name + "<br/>" );
        //Response.Write( "postcode: " + ((User)Page.User.Identity).Postcode + "<br/>" );
        //Response.Write( "role: " + ((User)Page.User.Identity).Role.Name + "<br/>" );
        
        //Response.Write( "<br/>isAuthenticated: " + Page.User.Identity.IsAuthenticated + "<br/>" );
        //Response.Write( "name: " + Page.User.Identity.Name + "<br/>" );
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

