<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Model.Entity.Basket>" %>

<div id="cart">
    <% if (Model.Items.Count > 0) { %>
        <span class="caption">
            Your jumblist: <%= Model.Items.Count %> items
        </span>
        <%= Html.ActionLink( "Email", "email", "basket", new { returnUrl = Request.Url.PathAndQuery }, null ) %>    
    <% } else { %> 
        Your jumblist is empty   
    <% } %>
</div>