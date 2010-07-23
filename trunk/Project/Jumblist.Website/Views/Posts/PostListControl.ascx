﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<PagedList<Post>>" %>


<table border="0" cellpadding="0" cellspacing="0" class="post-list">

<% foreach ( var post in Model )
   { %>
   
    <tr class="post-item">
    <td>
    
        <table class="post-detail">
        <tr>
        <td width="15%">
            <%= Html.Encode( post.Category.Name ) %>
        </td>
        <td width="61%" class="post-title">
            <%= Html.RouteLink( post.Title, "Post-Detail", new { id = post.PostId, name = post.Title.ToFriendlyUrlEncode() }, new { title = post.Body, @class = "post-link" } ) %>
        </td>        
        <td width="24%" colspan="2">
            <%= Ajax.SavePostToBasketLink( "Save", new { id = post.PostId } )%>
            <%= Ajax.EmailPostLink( "Email", new { id = post.PostId } )%>
            <%= Html.MapLink( post )%>
        </td>
        </tr>
        
        <tr>
        <td class="post-tags">
            <%= Html.Encode( post.NumberofViews ) %> views
        </td>        
        <td class="post-tags">
            Tags: <%= Html.PostTagListLinks( post.Tags )%>
        </td>
        <td class="post-time" width="10%">
            <%= (DateTime.Now.Subtract( post.PublishDateTime )).ToDateTimeDiff( post.PublishDateTime )%>
        </td>
        <td class="post-groupuser" width="14%">
            <%= Html.PostOriginLink( post )%>
        </td>
        </tr>
        </table>
    
    </td>
    </tr>
        
<% } %>
</table>

