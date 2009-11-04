<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IQueryable<Jumblist.Model.Entity.PostCategory>>" %>

<table cellpadding="5" border="1">
<tr><td colspan="2">Post Categories</td></tr>
<% foreach ( var category in Model )
   { %>
        <tr class="item">
            <td><%= category.Name %></td> 
            <td><%= Html.ActionLink( "Posts", "category", "posts", new { parameter1 = Url.ToFriendlyUrl( category.Name ) }, null )%></td>
        </tr>            
<% } %>
</table>