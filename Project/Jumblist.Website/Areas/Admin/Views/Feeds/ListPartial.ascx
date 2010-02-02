<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Feed>>" %>

<table class="list">
<% foreach ( var feed in Model )
   { %>
        <tr class="item">
            <td class="bold"><a href="<%= Html.Encode( feed.Url ) %>"><%= Html.Encode( feed.Title ) %></a></td>  
            <td><%= Html.Encode( feed.Category.Name ) %></td>  
            <td><%= Html.ActionLink( "Edit", "edit", new { id = feed.FeedId } )%></td>  
            <td><%= Ajax.ActionLink( "Delete", "delete", new { id = feed.FeedId }, new AjaxOptions { Confirm = "Delete '" + feed.Title + "' Feed?", HttpMethod = "Delete", UpdateTargetId = "itemsList" } )%></td> 
            <td><%= Html.ActionLink( "List Posts", "listbyfeed", "posts", new { id = feed.FeedId }, null )%></td> 
        </tr> 
<% } %>
</table>         
