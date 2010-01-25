<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Feed>>" %>

<table class="list">
<% foreach ( var feed in Model )
   { %>
        <tr class="item">
            <td><%= Html.Encode( feed.Title ) %></td>  
            <td><%= Html.ActionLink( "Edit", "edit", new { id = feed.FeedId } )%></td>  
            <td><%= Ajax.ActionLink( "Delete", "delete", new { id = feed.FeedId }, new AjaxOptions { Confirm = "Delete '" + feed.Title + "' Feed?", HttpMethod = "Delete", UpdateTargetId = "itemsList" } )%></td> 
        </tr> 
<% } %>
</table>         
