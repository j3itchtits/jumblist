<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Tag>>" %>

<table cellpadding="5">
<% foreach ( var tag in Model )
   { %>
        <tr class="item">
            <td><%= Html.ActionLink( tag.Name, "tagged", "posts", new { parameter1 = Url.ToFriendlyUrl( tag.Name ) }, null )%></td>
             
        </tr>            
<% } %>
</table>