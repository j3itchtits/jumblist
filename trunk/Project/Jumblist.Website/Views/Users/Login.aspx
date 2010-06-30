<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>
    
    <p>Please enter your name or email and password. <%= Html.RegisterLink( "Register" )%> if you don't have an account.</p>


	<% using( Html.BeginForm() ) { %>
	
        <p><label for="name">Name</label>
        <%= Html.TextBox("name") %></p>
        
        <p><label for="password">Password</label>
        <%= Html.Password("password") %></p>
        
        <p><label for="rememberMe">Remember Me?</label>
        <%= Html.CheckBox( "rememberMe" )%></p>
        
        <input type="submit" value="Log On" /> [ <%= Html.ActionLink( "Forgotten password", "forgottenpassword", "users" ) %> ]
        
	<% } %>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>