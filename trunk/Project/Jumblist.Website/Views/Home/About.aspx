<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server"><%= Html.PageTitle( ViewData.Model )%></asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Html.PageTitle( ViewData.Model )%></h2>
    
    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>

    <p>Jumblist is a free and open service which provides details of all UK Freecycle/Freegle posts and allows them to be fully searchable by keyword (tag), location or group.</p>
    
    <p>Search results are made available as both lists and maps.</p>

    <p>Registered users can save and email individual posts or keep track of new posts by saving searches as email alerts or using the rss feeds.</p>
    
    <p>Registered users can also post their own offers or requests to the community.</p>
    
            

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>