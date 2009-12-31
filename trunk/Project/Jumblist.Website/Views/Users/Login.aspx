<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Login
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>Log On</h2>
    
    <p>Please enter your username and password. <%= Html.RegisterLink( "Register" )%> if you don't have an account.</p>

    <h1>Login</h1>

    <%= Html.MessageBox( ViewData.Model ) %>

	<% using( Html.BeginForm() ) { %>
        <p><label for="username">Email</label>
        <%= Html.TextBox("email") %></p>
        
        <p><label for="password">Password</label>
        <%= Html.Password("password") %></p>

        <input type="submit" value="Log On" />
	<% } %>

</asp:Content>
