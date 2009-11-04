<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Model.Entity.LocationCategory>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Category
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Locations By Category - <%= Model.Name %></h2>

    <% 
        foreach (var location in Model.Locations)
        {
            Html.RenderPartial( "LocationSummary", location );
        }
    %>
    


</asp:Content>