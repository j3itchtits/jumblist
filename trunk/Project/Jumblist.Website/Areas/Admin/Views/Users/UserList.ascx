<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<User>>" %>

<table class="list">
<% foreach ( var user in Model )
   { %>
        <tr class="item-active-<%= user.IsActive.ToString().ToLower() %>">
            <td class="bold"><%= user.Name%></td>  
            <td><%= Html.ActionLink( "Edit", "edit", new { id = user.UserId } )%></td>  
            <td><%= Ajax.ActionLink( "Delete", "delete", new { id = user.UserId }, new AjaxOptions { Confirm = "Delete '" + user.Name + "' User?", HttpMethod = "Delete", UpdateTargetId = "itemsList" } )%></td>  
            <td>[ <%= Html.ActionLink( "List Posts", "listbyuser", "posts", new { id = user.UserId }, null )%> ]</td> 
        </tr> 
<% } %>
</table>         

