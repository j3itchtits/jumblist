<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Data.Entity.Temp>" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
	<title>Admin - Edit Temp - <%= Model.Name %></title>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit Temp - <%= Model.Name %></h2>

    <% using (Html.BeginForm( "savetemp", "admin" )) { %>

        <%= Html.Hidden( "TempId" ) %>

        
        <table border="1" style="margin: 10px 0px">
        
        <tr>
            <td>Name: </td>
            <td><%= Html.TextBox( "Name" )%> <%= Html.ValidationMessage( "Name" )%></td>
        </tr>
        
        </table>       
        
        <input type="submit" value="Save" /> &nbsp;&nbsp;<%= Html.ActionLink( "Cancel", "temp" ) %>
        
    <% } %>
    
</asp:Content>

