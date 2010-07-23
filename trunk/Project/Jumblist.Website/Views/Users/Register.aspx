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

    <%= Html.ClientSideValidation<User>( "Item" )%>
        
    <p>Please submit your details. <%= Html.LoginLink( "Log In" )%> if you already have an account.</p>

	<% using( Html.BeginForm() ) { %>
	
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
        
        <tr>
            <td width="30%" class="field-label"><label for="Item_Name">Name</label></td>
            <td width="40%" class="field-input"><%= Html.TextBoxFor( m => m.Item.Name, new { @class = "fancy-field" } )%></td>
            <td width="30%" class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please enter a username
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.Name )%>
                </span>
            </td>
        </tr>
        
        <tr>
            <td class="field-label"><label for="Item_Email">Email</label></td>
            <td class="field-input"><%= Html.TextBoxFor( m => m.Item.Email, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please enter your email address
                </span>            
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.Email )%>
			    </span>                

            </td>
        </tr>
        
        <tr>
            <td class="field-label"><label for="Item_Postcode">Postcode</label></td>
            <td class="field-input"><%= Html.TextBoxFor( m => m.Item.Postcode, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please enter a valid UK postcode
                </span> 
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.Postcode )%>
                </span>
            </td>            
        </tr> 

        <tr>
            <td class="field-label"><label for="Item_Password">Password</label></td>
            <td class="field-input"><%= Html.PasswordFor( m => m.Item.Password, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please enter a password of more than 6 characters
                </span>             
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.Password )%>
                </span>
            </td>                
        </tr>
        
        <tr>
            <td class="field-label"><label for="ConfirmPassword">Confirm Password</label></td>
            <td class="field-input"><%= Html.Password( "ConfirmPassword", string.Empty, new { @class = "fancy-field" } )%></td> 
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please confirm your password
                </span>             
                <span class="field-validation-error">
                    <%= Html.ValidationMessage( "ConfirmPassword" )%> 
                </span>
            </td>               
        </tr>
        </table>

        <div>
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Register" ) %>
        </div>
       
	<% } %>

</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>