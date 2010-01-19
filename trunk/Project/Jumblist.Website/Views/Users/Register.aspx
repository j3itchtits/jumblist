<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	<%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>

    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<User>( "User" )%>
        
    <p>Please submit your details. <%= Html.LoginLink( "Log In" )%> if you already have an account.</p>

	<% using( Html.BeginForm() ) { %>
	
        <p>
            <label for="User.Name">Name</label>
            <%= Html.TextBox( "User.Name" )%>
            <%= Html.ValidationMessage( "User.Name" )%>
        </p>

        <p>
            <label for="User.Email">Email</label>
            <%= Html.TextBox( "User.Email" )%>
            <%= Html.ValidationMessage( "User.Email" )%>
        </p>

        <p>
            <label for="User.Postcode">Postcode</label>
            <%= Html.TextBox( "User.Postcode" )%>
            <%= Html.ValidationMessage( "User.Postcode" )%>
        </p>
        
        <p>
            <label for="User.Password">Password</label>
            <%= Html.Password( "User.Password" )%>
            <%= Html.ValidationMessage( "User.Password" )%>            
        </p>

        <p>
            <label for="ConfirmPassword">Confirm Password</label>
            <%= Html.Password( "ConfirmPassword" )%>
            <%= Html.ValidationMessage( "User.ConfirmPassword" )%>  
        </p>

        <%= Html.SubmitButton( "submit", "Register" ) %>
        
	<% } %>

</asp:Content>
