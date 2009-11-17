<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Website.Services.Paging.PaginatedList<Jumblist.Data.Model.Tag>>" %>

<div>
<% foreach ( var tag in Model )
   { %>
        <p>
            <%= Html.ActionLink( tag.Name, "tagged", "posts", new { parameter1 = Url.ToFriendlyUrl( tag.Name ) }, null )%>
        </p>            
<% } %>
</div>