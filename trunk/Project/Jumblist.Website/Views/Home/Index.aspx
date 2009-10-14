<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Home</h2>
    

    <textarea cols="20" rows="2"><%= ViewData["Output"] %></textarea>
    <p>
        Put content here.
    </p>

        
</asp:Content>
