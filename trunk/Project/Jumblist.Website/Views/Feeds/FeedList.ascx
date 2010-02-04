<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Feed>>" %>

<table class="list">
<% foreach ( var feed in Model )
   { %>
        <tr class="item">
            <td><%= feed.Title%></td>  
            <td><%= Html.ActionLink( "Detail", "detail", new { id = feed.FeedId } )%></td>  
        </tr> 
<% } %>
</table>         
