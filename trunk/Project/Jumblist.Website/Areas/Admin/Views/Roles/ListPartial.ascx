<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Role>>" %>

<table class="list">
<% foreach ( var entity in Model )
   { %>
        <tr class="item">
            <td><%= Html.Encode( entity.Name )%></td>  
            <td><%= Html.ActionLink( "Edit", "edit", new { id = entity.RoleId } )%></td>  
            <td><%= Ajax.ActionLink( "Delete", "delete", new { id = entity.RoleId }, new AjaxOptions { Confirm = "Delete '" + entity.Name + "' Post?", HttpMethod = "Delete", UpdateTargetId = "itemsList" } )%></td> 
        </tr> 
<% } %>
</table>         
