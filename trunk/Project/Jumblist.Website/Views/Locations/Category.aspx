<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Model.Entity.LocationCategory>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Category
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>Locations By Category - <%= Model.Name %></h2>

    <% Html.RenderPartial( "ListLocations", Model.Locations ); %>
    


</asp:Content>
