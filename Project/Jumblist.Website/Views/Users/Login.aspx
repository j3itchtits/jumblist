<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <p>Please enter your name and password. <%= Html.RegisterLink( "Register" )%> if you don't have an account.</p>

    <%= Html.MessageBox( ViewData.Model ) %>

	<% using( Html.BeginForm() ) { %>
        <p><label for="name">Name</label>
        <%= Html.TextBox("name") %></p>
        
        <p><label for="password">Password</label>
        <%= Html.Password("password") %></p>
        
        <p><label for="rememberMe">Remember Me?</label>
        <%= Html.CheckBox( "rememberMe" )%></p>
        
        
        <input type="submit" value="Log On" />
	<% } %>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>