<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Register
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>Register</h2>
    
    <p>Please submit your details. <%= Html.LoginLink( "Log In" )%> if you already have an account.</p>

    <%= Html.MessageBox( ViewData.Model )%>

	<% using( Html.BeginForm() ) { %>
	
	    <p><label for="name">Name</label>
        <%= Html.TextBox("name") %></p>
        
        <p><label for="email">Email</label>
        <%= Html.TextBox( "email" )%></p>
        
        <p><label for="password">Password</label>
        <%= Html.Password( "password" )%></p>
        
        <p><label for="confirmpassword">Confirm Password</label>
        <%= Html.Password( "confirmpassword" )%></p>

        <%= Html.SubmitButton( "submit", "Register" ) %>
        
	<% } %>

</asp:Content>
