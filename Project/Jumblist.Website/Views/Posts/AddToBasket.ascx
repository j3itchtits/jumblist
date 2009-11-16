<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Model.Entity.Post>" %>

<%  using ( Html.BeginForm( "add", "basket" ) ) { %>
        <%= Html.Hidden( "postId" ) %>
        <%= Html.Hidden( "returnUrl", HttpContext.Current.Request.Url.PathAndQuery )%>
        <input type="submit" value="Add to basket" />
    <% } %>