<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Tag>>" %>

<div>
<% foreach ( var tag in Model )
   { %>
        <p>
            <%= tag.Name %> (<%= tag.Category.Name%>) - <%= Html.ActionLink( "Posts", "tagged", "posts", new { parameter1 = Url.ToFriendlyUrl( tag.Name ) }, null )%>             
        </p>            
<% } %>
</div>