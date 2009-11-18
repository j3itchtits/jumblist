<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Data.Entity.Post>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Model.Title %></h2>
    
    <div class="post-item">
        <div>Url: <a href="<%= Model.Url %>" target="_blank">Linkback</a></div>     
        <div>Body: <%= Model.Body %></div> 
        <div>Date: <%= Model.DateTime.ToShortDateString() %></div> 
        <div>Category: <%= Model.Category.Name %></div> 
        <div>Lat: <%= Model.Latitude.ToString() %></div> 
        <div>Long: <%= Model.Longitude.ToString() %></div> 
        <div>Display?: <%= Model.Display.ToString() %></div> 
        <div>Author: <%= Model.Author.Name %></div> 
        <div>Feed: <%= Model.Feed.Title %></div> 
        <div><% Html.RenderPartial( "AddToBasket", Model ); %></div>
    </div>
    
    <div class="post-locations">
        <div><b>Locations: </b>
        <% foreach ( var location in Model.Locations )
           {
               Response.Write( location.Name + ", " );
           } %>
        </div>
    </div>

    <div class="post-tags">
        <div><b>Tags: </b>
        <% foreach ( var tag in Model.Tags )
           {
               Response.Write( tag.Name + ", " );
           } %>
        </div>
    </div>
    
</asp:Content>
