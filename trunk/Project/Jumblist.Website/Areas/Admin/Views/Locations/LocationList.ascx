<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Location>>" %>

<table class="list">
<% foreach ( var location in Model )
   { %>
        <tr class="item">
            <td class="bold"><%= Html.Encode( location.Name )%></td>  
            <td><%= Html.Encode( location.Category.Name )%></td>  
            <td><%= Html.ActionLink( "Edit", "edit", new { id = location.LocationId } )%></td>  
            <td><%= Ajax.ActionLink( "Delete", "delete", new { id = location.LocationId }, new AjaxOptions { Confirm = "Delete '" + location.Name + "' Post?", HttpMethod = "Delete", UpdateTargetId = "itemsList" } )%></td> 
            <td>[ <%= Html.ActionLink( "List Posts", "listbylocationid", "posts", new { id = location.LocationId }, null )%> ]</td> 
           
        </tr> 
<% } %>
</table>         
