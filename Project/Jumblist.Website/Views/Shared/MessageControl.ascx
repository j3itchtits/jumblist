<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Core.Model.Message>" %>

<div id="system-message">
    <%= Html.MessageBox( Model ) %>
</div>

