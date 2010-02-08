<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Tag>>" %>

<table class="list">
<% foreach ( var tag in Model )
   { %>
        <tr class="item">
            <td><%= Html.ActionLink(Html.Encode(tag.Name), "tagged", "posts", new { id = tag.Name.ToFriendlyUrl() }, null)%></td>             
        </tr> 
<% } %>
</table>         
