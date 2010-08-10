<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% 
    if (!((ViewContext.Controller is BasketController) || (ViewContext.Controller is UsersController)))
    {         
        Html.RenderAction( "Widget", "Basket" );
    } 
%>