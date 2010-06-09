<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>

    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<User>( "Item" )%>
        
    <p>Please submit your details. <%= Html.LoginLink( "Log In" )%> if you already have an account.</p>

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
            <td><%= Html.TextBoxFor( m => m.Item.Postcode )%>
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
        </table>

        <%= Html.AntiForgeryToken() %>
        <%= Html.SubmitButton( "submit", "Register" ) %>
        
	<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>