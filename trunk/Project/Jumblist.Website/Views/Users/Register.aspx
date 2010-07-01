<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>

    <div id="messages">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>

    <%= Html.ClientSideValidation<User>( "Item" )%>
        
    <p>Please submit your details. <%= Html.LoginLink( "Log In" )%> if you already have an account.</p>

	<% using( Html.BeginForm() ) { %>
	
        <table>
        
        <tr>
            <td><label for="Item.Name">Name:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Name ) %></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Please enter a username
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
                <div class="label-box error" style="display: none;">
                    <%= Html.ValidationMessageFor( m => m.Item.Name )%>
			    </div>
            </td>
        </tr>
        
        <tr>
            <td><label for="Item.Email">Email:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Email ) %></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Please enter your email address
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
                <div class="label-box error" style="display: none;">
                    <%= Html.ValidationMessageFor( m => m.Item.Email )%>
			    </div>
            </td>
        </tr>
        
        <tr>
            <td><label for="Item.Postcode">Postcode:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Postcode )%></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Please enter your postcode
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
                <div class="label-box error" style="display: none;">
                    <%= Html.ValidationMessageFor( m => m.Item.Postcode )%>
			    </div>
            </td>            
        </tr> 

        <tr>
            <td><label for="Item.Password">Password:</label></td>
            <td><%= Html.PasswordFor( m => m.Item.Password )%></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Please enter your postcode
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
                <div class="label-box error" style="display: none;">
                    <%= Html.ValidationMessageFor( m => m.Item.Password )%>
			    </div>
            </td>                
        </tr>
        <tr>
            <td><label for="ConfirmPassword">Confirm Password</label></td>
            <td><%= Html.Password( "ConfirmPassword" )%></td> 
            <td>
                <div class="label-box info" style="display: none;">
                   Please confirm your password
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
                <div class="label-box error" style="display: none;">
                    <%= Html.ValidationMessage( "Item.ConfirmPassword" )%> 
			    </div>
            </td>               
            
        </tr>
        </table>

        <div>
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Register" ) %>
        </div>
        
       
	<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>