<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Model.Entity.Location>" %>

<div class="item">
    <p>
        <%=Model.Name%> (<%= Model.Category.Name%>) - <%= Html.ActionLink( "Posts", "location", "posts", new { parameter1 = Url.ToFriendlyUrl( Model.Name ) }, null )%>
    </p> 
</div>    