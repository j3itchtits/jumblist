﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Tag>>" %>

<table class="list">
<% foreach ( var tag in Model )
   { %>
        <tr class="item">
            <td><%= tag.Name%></td>  
            <td><%= Html.ActionLink( "Edit", "edit", new { id = tag.TagId } )%></td>  
            <td><%= Ajax.ActionLink( "Delete", "delete", new { id = tag.TagId }, new AjaxOptions { Confirm = "Delete '" + tag.Name + "' Post?", HttpMethod = "Delete", UpdateTargetId = "itemsList" } )%></td> 
        </tr> 
<% } %>
</table>         
