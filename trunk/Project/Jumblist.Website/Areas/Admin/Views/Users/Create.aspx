<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	<%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>

    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<User>( "Item" )%>
        
	<% using( Html.BeginForm() ) { %>
	
        <table>
        <tr>
            <td><label for="Item.Name">Name:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Name ) %>
            <%= Html.ValidationMessageFor( m => m.Item.Name )%></td>
        </tr>
        <tr>
            <td><label for="Item.Email">Email:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Email ) %>
            <%= Html.ValidationMessageFor( m => m.Item.Email )%></td>
        </tr>
        <tr>
            <td><label for="Item.Postcode">Postcode:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Postcode, new { @class = "text-upper" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.Postcode )%></td>
        </tr>     
        <tr>
            <td><label for="Item.Password">Password:</label></td>
            <td><%= Html.PasswordFor( m => m.Item.Password )%>
            <%= Html.ValidationMessageFor( m => m.Item.Password )%></td>
        </tr>
        <tr>
            <td><label for="ConfirmPassword">Confirm Password</label></td>
            <td><%= Html.Password( "ConfirmPassword" )%>
            <%= Html.ValidationMessage( "Item.ConfirmPassword" )%></td>  
        </tr>
        <tr>
            <td><label for="Item.RoleId">RoleId</label></td>
            <td><%= Html.DropDownList( "Item.RoleId", new SelectList( Model.SelectList<Role>(), "RoleId", "Name", Model.Item.RoleId ), "-- Select --" )%>
            <%= Html.ValidationMessage( "Item.RoleId" )%>  </td>
        </tr>
        </table>
        
        <p>
            <%= Html.SubmitButton( "submit", "Create" ) %>
        </p>
        
	<% } %>

</asp:Content>
