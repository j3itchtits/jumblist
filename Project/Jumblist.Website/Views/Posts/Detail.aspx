<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model ) %>

    <div class="post-item">
    
        <div><a href="<%= Model.Item.Url %>" target="_blank">Original Post on <%= Model.Item.Feed.Name %></a></div>     
        <div style="padding: 20px 0px;"><%= Html.Encode( Model.Item.Body ).ReplaceParagraphBreaks()%></div>
        <div>Publish Date: <%= Model.Item.PublishDateTime %></div> 

    </div>
   
    
</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentRight" runat="server">

    <div class="post-category">
        <b>Category: </b><br />
        <%= Html.ActionLink( Model.Item.Category.Name, "category", new { id = Model.Item.Category.Name.ToFriendlyUrlEncode() } ) %>
    </div>

    <div class="post-group">
        <b>Group: </b><br />
        <%= Html.ActionLink( Model.Item.Feed.Name, "group", new { id = Model.Item.Feed.FriendlyUrl } )%>
    </div>
    
    <div class="post-tags">
        <b>Tags: </b><br />
        <%= Model.Item.Tags.ToLinkedTagList() %>
    </div>
    
    <div class="post-locations">
        <b>Locations: </b><br />
        <%= Model.Item.Locations.ToLinkedLocationList()%>        
    </div>


    
</asp:Content>

