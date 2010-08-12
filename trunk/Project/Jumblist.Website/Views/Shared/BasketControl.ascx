<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% 
    if (!((ViewContext.Controller is BasketController) || (ViewContext.Controller is UsersController)))
    {         
        %><span id="basket"><% Html.RenderAction( "Widget", "Basket" ); %></span><%
    } 
%>