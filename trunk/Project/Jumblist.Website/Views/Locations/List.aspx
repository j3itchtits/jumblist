<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Location>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	List Locations
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>All Locations</h2>

    <% Html.RenderPartial( "ListLocations", Model ); %>
    
    <p><%= Html.PagingLinks( Model.CurrentPage, Model.TotalPages, x => Url.Action( "list", new { parameter1 = x } ) )%></p>
    
  
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <% Html.RenderAction( "categories" ); %>
         
</asp:Content>