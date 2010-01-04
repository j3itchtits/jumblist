<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Basket>" %>

<div id="cart">
    <% if (Model.Items.Count > 0) { %>
        <span class="caption">
            <%= Html.ActionLink( "Your jumblist", "index", "basket", new { returnUrl = Request.Url.PathAndQuery }, null )%> : <%= Model.Items.Count %> items
        </span>
        <%= Html.ActionLink( "[ Email Me ]", "email", "basket", new { returnUrl = Request.Url.PathAndQuery }, null )%>    
    <% } else { %> 
        Your jumblist is empty   
    <% } %>
</div>