<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>
    
    <p>Please enter your name or email and password. <%= Html.RegisterLink( "Register" )%> if you don't have an account.</p>


	<% using ( Html.BeginForm() ) { %>

        <table class="form-thin">
        
        <tr>
            <td class="field-label"><label for="name">Name/Email</label></td>
            <td class="field-input"><%= Html.TextBox( "name", string.Empty, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please enter your username or email address
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessage( "name" )%>
                </span>
            </td>
        </tr>
        
        <tr>
            <td class="field-label"><label for="password">Password</label></td>
            <td class="field-input"><%= Html.Password( "password", string.Empty, new { @class = "fancy-field" } ) %></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please enter your password
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessage( "password" )%>
			    </span>
            </td>
        </tr>
        
        <tr>
            <td class="field-label"><label for="rememberMe">Remember Me?</label></td>
            <td class="field-input"><%= Html.CheckBox( "rememberMe", false, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Tick this to be remembered on this site
                </span>
            </td>
        </tr>
        </table>
        	
        <div class="button-submit">
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Log On" )%>
        </div>
        
	<% } %>
	        
    <div>
        [ <%= Html.ActionLink( "Forgotten password", "forgottenpassword", "users" ) %> ]
    </div>
        


</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>