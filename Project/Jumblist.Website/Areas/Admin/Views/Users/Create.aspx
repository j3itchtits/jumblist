<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	<%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>

    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<User>( "User" )%>
        
	<% using( Html.BeginForm() ) { %>
	
	    <table>
        <tr>
            <td><label for="User.Name">Name</label></td>
            <td><%= Html.TextBox( "User.Name" )%>
            <%= Html.ValidationMessage( "User.Name" )%></td>
        </tr>
        <tr>
            <td><label for="User.Email">Email</label></td>
            <td><%= Html.TextBox( "User.Email" )%>
            <%= Html.ValidationMessage( "User.Email" )%></td>
        </tr>
        <tr>
            <td><label for="User.Password">Password</label></td>
            <td><%= Html.Password( "User.Password" )%>
            <%= Html.ValidationMessage( "User.Password" )%>            </td>
        </tr>
        <tr>
            <td><label for="ConfirmPassword">Confirm Password</label></td>
            <td><%= Html.Password( "ConfirmPassword" )%>
            <%= Html.ValidationMessage( "User.ConfirmPassword" )%></td>  
        </tr>
        <tr>
            <td><label for="User.RoleId">RoleId</label></td>
            <td><%= Html.DropDownList( "User.RoleId", new SelectList( Model.LookupList<Role>(), "RoleId", "Name", Model.Item.RoleId ), "-- Select --" )%>
            <%= Html.ValidationMessage( "User.RoleId" )%>  </td>
        </tr>
        </table>
        
        <p>
            <%= Html.SubmitButton( "submit", "Create" ) %>
        </p>
        
	<% } %>

</asp:Content>
