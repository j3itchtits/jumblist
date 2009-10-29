<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Post>>" %>

<table cellpadding="5">
<% foreach ( var post in Model )
   { %>
        <tr class="item">
            <td><%= Html.RouteLink( post.Title, "Detail", new { id = post.PostId, name = Url.ToFriendlyUrl( post.Title ) } )%></td>  
          
            <td><%= post.Url %></td>      
            <td><%= post.Body %></td>  
            <td><%= post.DateTime.ToShortDateString() %></td>
            <td><%= post.CategoryId %></td>
            <td><%= post.Latitude.ToString() %></td>
            <td><%= post.Longitude.ToString() %></td>
            <td><%= post.Display.ToString() %></td>
            <td><%= post.AuthorId.ToString() %></td>
            <td><%= post.FeedId.ToString() %></td>
        </tr>            
<% } %>
</table>