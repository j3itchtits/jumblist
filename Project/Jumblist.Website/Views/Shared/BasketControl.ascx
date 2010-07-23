<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% 
    if (!((ViewContext.Controller is BasketController) || (ViewContext.Controller is UsersController)))
    { %>
        <div id="basket">
            <% Html.RenderAction( "Widget", "Basket" ); %>
        </div> <%
    } 
%>