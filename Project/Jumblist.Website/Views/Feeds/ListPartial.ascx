<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Jumblist.Core.Model.Feed>>" %>

<table class="list">
<% foreach ( var feed in Model )
   { %>
        <tr class="item">
            <td><%= feed.Title%></td>  
            <td><%= Html.ActionLink( "Detail", "detail", new { id = feed.FeedId } )%></td>  
            <td><%= Html.ActionLink( "Edit", "edit", new { id = feed.FeedId } )%></td>  
            <td><%= Ajax.ActionLink( "Delete", "delete", new { id = feed.FeedId }, new AjaxOptions { Confirm = "Delete Feed?", HttpMethod = "Delete", UpdateTargetId = "itemsList" } )%></td> 
        </tr> 
<% } %>
</table>         
