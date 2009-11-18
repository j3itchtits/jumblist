<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Data.Entity.Author>" %>

<div class="item">
    <p>
        <%=Model.Name%> - <%= Html.ActionLink( "Posts", "author", "posts", new { parameter1 = Url.ToFriendlyUrl( Model.Name ) }, null )%>
    </p> 
</div>    