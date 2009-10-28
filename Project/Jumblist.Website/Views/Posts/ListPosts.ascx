<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Jumblist.Model.Entity.Post>>" %>

<table cellpadding="5">
<% foreach ( var post in Model )
   { %>
        <tr class="item">
            <td><%= Html.ActionLink( post.Title, "Details", new { id = post.PostId } ) %></td>   
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