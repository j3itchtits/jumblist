<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Data.Entity.Tag>" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
	<title>Admin - Edit Tag - <%= Model.Name %></title>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit Tag - <%= Model.Name %></h2>

    <% using (Html.BeginForm( "edittag", "admin" )) { %>

        <%= Html.Hidden( "TagId" ) %>
        <%= Html.Hidden( "ParentId" )%>
        
        <table border="1" style="margin: 10px 0px">
        
        <tr>
            <td>Name: </td>
            <td><%= Html.TextBox( "Name" )%> <%= Html.ValidationMessage( "Name" )%></td>
        </tr>
        
        </table>       
        
        <input type="submit" value="Save" /> &nbsp;&nbsp;<%= Html.ActionLink( "Cancel", "tags" ) %>
        
    <% } %>
    
</asp:Content>

