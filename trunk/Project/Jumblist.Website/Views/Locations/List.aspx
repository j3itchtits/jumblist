<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Location>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>All Locations</h2>

    <% 
        foreach ( var location in Model )
        {
            Html.RenderPartial( "LocationSummary", location );
        }
    %>
    
    

    <p><%= Html.ActionLink( "Categories", "categories" ) %></p>
    
    <p>Filter by Categories: <% Html.RenderAction( "categories" ); %></p>
    
</asp:Content>
