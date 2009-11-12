<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Tag>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">
    
    <h2>All Tags</h2>
    
    <% Html.RenderPartial( "ListTags", Model ); %>

    <p><%= Html.PagingLinks( Model.CurrentPage, Model.TotalPages, x => Url.Action( "List", new { parameter1 = x } ) )%></p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    
</asp:Content>