<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<TestViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Html.Encode( Model.PageTitle ) %></h2>
         
    <p><%= Model.HttpResponse %></p>
    
    <p><pre><%= Html.Encode( Model.HttpResponse ) %></pre></p>
    
</asp:Content>  

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    tESTING
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
