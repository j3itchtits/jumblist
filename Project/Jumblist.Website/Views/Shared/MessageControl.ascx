<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Core.Model.Message>" %>

<div id="messages">
    <%= Html.MessageBox( Model ) %>
</div>

