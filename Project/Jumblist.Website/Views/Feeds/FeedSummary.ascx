﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Model.Entity.Feed>" %>

<div class="item">
    <p>
        <%=Model.Title%> - <%= Html.ActionLink( "Posts", "feed", "posts", new { parameter1 = Url.ToFriendlyUrl( Model.Title ) }, null )%>
    </p> 
</div>    