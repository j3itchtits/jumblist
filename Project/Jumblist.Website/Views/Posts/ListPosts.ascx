<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Post>>" %>

<table cellpadding="5" class="list">
<% foreach ( var post in Model )
   { %>
        <tr class="item">
            <td><%= Html.RouteLink( post.Title, "Detail", new { id = post.PostId, name = Url.ToFriendlyUrl( post.Title ) } )%></td>  
            <td><a href="<%= post.Url %>">Linkback</a></a></td>      
            <td><%= post.DateTime.ToShortDateString() %></td>
            <td><%= post.Category.Name %></td>
            <td><%= post.Author.Name %></td>
            <td><%= post.Feed.Title %></td>
        </tr>            
<% } %>
</table>