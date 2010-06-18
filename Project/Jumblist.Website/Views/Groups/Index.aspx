<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Feed>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Html.PageTitle( ViewData.Model )%></h2>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>
        
    <div id="grouplist">
        <% Html.RenderPartial( "GroupListControl", Model.List ); %>
    </div>
    
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>