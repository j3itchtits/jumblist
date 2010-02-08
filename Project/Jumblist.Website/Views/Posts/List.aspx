<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	<%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model ) %>
    
    <div id="itemsList">
        <% Html.RenderPartial( "PostList", Model.PaginatedList ); %>
    </div>
   
   
    <p><%= Html.PagingLinks(Model.PaginatedList.CurrentPage, Model.PaginatedList.TotalPages, x => Url.Action(ViewData["Action"].ToString(), new { id = ViewData["Id"].ToString(), page = x }))%></p>
    
    <p><%= Html.NextPreviousPageLinks(Model.PaginatedList.CurrentPage, Model.PaginatedList.HasPreviousPage, Model.PaginatedList.HasNextPage, x => Url.Action(ViewData["Action"].ToString(), new { id = ViewData["Id"].ToString(), page = x }))%></p>
    

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    
</asp:Content>
