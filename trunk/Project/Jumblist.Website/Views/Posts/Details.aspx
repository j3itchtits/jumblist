<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Model.Entity.Post>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%= Model.Title %></h2>
    
    <table cellpadding="5">
    <tr><td>Url: <a href="<%= Model.Url%>" target="_blank">Yahoo</a> </td> </tr>     
    <tr><td>Body: <%= Model.Body%></td> </tr> 
    <tr><td>Date: <%= Model.DateTime.ToShortDateString()%></td></tr>
    <tr><td>Category: <%= Model.CategoryId%></td></tr>
    <tr><td>Lat: <%= Model.Latitude.ToString()%></td></tr>
    <tr><td>Long: <%= Model.Longitude.ToString()%></td></tr>
    <tr><td>Display?: <%= Model.Display.ToString()%></td></tr>
    <tr><td>AuthorId: <%= Model.AuthorId.ToString()%></td></tr>
    <tr><td>FeedId; <%= Model.FeedId.ToString()%></td></tr>
  
    </table>

</asp:Content>
