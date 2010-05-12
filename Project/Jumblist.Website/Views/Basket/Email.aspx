<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model ) %>
    
    Please enter your details and we will email you your items!
    
    <% using(Html.BeginForm()) { %>
        <table>
        <tr><td>Name: </td><td><%= Html.TextBox( "Name" )%></td></tr>
        <tr><td>Email address: </td><td><%= Html.TextBox( "Email" )%></td></tr>
        <tr><td>Your postcode: </td><td><%= Html.TextBox( "PostCode" )%></td></tr>
        </table>
        <p align="center"><input type="submit" value="Email" /></p>
    <% } %>
    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
