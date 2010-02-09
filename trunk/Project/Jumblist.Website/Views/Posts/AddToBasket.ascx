<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Post>" %>

<%  using ( Html.BeginForm( "additem", "basket" ) ) { %>
    <%= Html.Hidden( "postId" ) %>
    <%= Html.Hidden( "returnUrl", HttpContext.Current.Request.Url.PathAndQuery )%>
    <input type="submit" value="Add to basket" />
<% } %>

