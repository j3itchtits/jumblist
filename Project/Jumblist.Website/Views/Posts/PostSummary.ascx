<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Data.Model.Post>" %>

<tr class="item">
    <td><%= Html.RouteLink( Model.Title, "Post-Detail", new { id = Model.PostId, name = Url.ToFriendlyUrl( Model.Title ) } )%></td>  
    <td><a href="<%= Model.Url %>">Linkback</a></td>      
    <td><%= Model.DateTime.ToShortDateString()%></td>
    <td><%= Model.Category.Name%></td>
    <td><%= Model.Author.Name%></td>
    <td><%= Model.Feed.Title%></td>
    <td><%= Model.Feed.Title%></td>    
</tr>   