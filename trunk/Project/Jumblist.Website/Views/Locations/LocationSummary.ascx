<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Data.Entity.Location>" %>

<div class="item">
    <p>
        <%= Html.ActionLink( Model.Name, "location", "posts", new { parameter1 = Url.ToFriendlyUrl( Model.Name ) }, null )%>
    </p>       
</div>    