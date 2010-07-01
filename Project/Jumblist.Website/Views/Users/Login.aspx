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

        <table>
        <tr>
            <td><label for="name">Name/Email</label></td>
            <td><%= Html.TextBox("name") %></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Please enter your name or email
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
                <div class="label-box error" style="display: none;">
                    <%= Html.ValidationMessage( "name" )%>
			    </div>
            </td>
        </tr>
        <tr>
            <td><label for="password">Password</label></td>
            <td><%= Html.Password("password") %></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Please enter your password
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
                <div class="label-box error" style="display: none;">
                    <%= Html.ValidationMessage( "password" )%>
			    </div>
            </td>
        </tr>
        <tr>
            <td><label for="rememberMe">Remember Me?</label></td>
            <td><%= Html.CheckBox( "rememberMe" )%></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Remember the details on this computure?
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
            </td>
        </tr>
        </table>
        	
        <div>
            <input type="submit" value="Log On" />
        </div>
        
        <div>
            [ <%= Html.ActionLink( "Forgotten password", "forgottenpassword", "users" ) %> ]
        </div>
        
	<% } %>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>