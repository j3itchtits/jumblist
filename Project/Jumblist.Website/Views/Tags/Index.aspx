<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Tag>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>
    
    <% Html.RenderPartial( "TagListControl", Model.PagedList ); %>

    <div class="pagerlinks">
        <%= Html.Pager( Model.PagedList.PageSize, Model.PagedList.PageNumber, Model.PagedList.TotalItemCount )%>
    </div>
                
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
