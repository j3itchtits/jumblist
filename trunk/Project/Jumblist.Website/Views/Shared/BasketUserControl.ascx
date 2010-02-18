<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% 
    if (!(ViewContext.Controller is BasketController))
    {
       Html.RenderAction( "Summary", "Basket" );  
    } 
%>