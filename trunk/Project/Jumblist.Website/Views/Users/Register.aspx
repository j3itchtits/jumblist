<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	<%= Html.PageTitle( Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( Model, HtmlTextWriterTag.H2 )%>

    <%= Html.MessageBox( Model ) %>

    <%= Html.ClientSideValidation<User>( "user" )%>
        
    <p>Please submit your details. <%= Html.LoginLink( "Log In" )%> if you already have an account.</p>

	<% using( Html.BeginForm() ) { %>
	
        <p>
            <label for="name">Name</label>
            <%= Html.TextBox( "name" )%>
            <%= Html.ValidationMessage( "user.name" )%>
        </p>

        <p>
            <label for="email">Email</label>
            <%= Html.TextBox( "email" )%>
            <%= Html.ValidationMessage( "user.email" )%>
        </p>

        <p>
            <label for="postcode">Postcode</label>
            <%= Html.TextBox( "postcode" )%>
            <%= Html.ValidationMessage( "user.postcode" )%>
        </p>
        
        <p>
            <label for="password">Password</label>
            <%= Html.Password( "password" )%>
            <%= Html.ValidationMessage( "user.password" )%>            
        </p>

        <p>
            <label for="confirmpassword">Confirm Password</label>
            <%= Html.Password( "confirmpassword" )%>
            <%= Html.ValidationMessage( "user.confirmpassword" )%>  
        </p>

        <%= Html.SubmitButton( "submit", "Register" ) %>
        
	<% } %>

</asp:Content>
