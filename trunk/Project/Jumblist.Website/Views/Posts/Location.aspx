<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Posts By Location
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>Posts By Location</h2>

    <% Html.RenderPartial( "ListPosts", Model ); %>


</asp:Content>
