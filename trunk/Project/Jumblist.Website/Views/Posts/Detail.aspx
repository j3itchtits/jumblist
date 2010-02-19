<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model ) %>

    <div class="post-item">
        <div><a href="<%= Model.Item.Url %>" target="_blank">Original Post</a></div>     
        <div style="padding: 20px 0px;"><%= Html.Encode( Model.Item.Body ).ReplaceParagraphBreaks()%></div>
        <div>Publish Date: <%= Model.Item.PublishDateTime %></div> 
        <div>Category: <%= Model.Item.Category.Name %></div> 

    </div>
    
    <div class="post-locations">
        <div><b>Locations: </b>
        <% foreach (var location in Model.Item.Locations)
           {
               Response.Write( location.Name + ", " );
           } %>
        </div>
    </div>

    <div class="post-tags">
        <div><b>Tags: </b>
        <% foreach (var tag in Model.Item.Tags)
           {
               Response.Write( tag.Name + ", " );
           } %>
        </div>
    </div>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>