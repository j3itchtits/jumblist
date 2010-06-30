<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% 
    if (!((ViewContext.Controller is BasketController) || (ViewContext.Controller is UsersController)) && (Page.Request.IsAuthenticated))
    { %>
        <div id="basket-widget">
            <% Html.RenderAction( "Widget", "Basket" ); %>
        </div> <%
    } 
%>