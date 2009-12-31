﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<User>>" %>

<table class="list">
<% foreach ( var user in Model )
   { %>
        <tr class="item">
            <td><%= user.Name%></td>  
            <td><%= Html.ActionLink( "Detail", "detail", new { id = user.UserId } )%></td>  
            <td><%= Html.ActionLink( "Edit", "edit", new { id = user.UserId } )%></td>  
            <td><%= Ajax.ActionLink( "Delete", "delete", new { id = user.UserId }, new AjaxOptions { Confirm = "Delete?", HttpMethod = "Delete", UpdateTargetId = "itemsList" } )%></td>  
        </tr> 
<% } %>
</table>         
