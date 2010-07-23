<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>

    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<User>( "Item" )%>
        
    <p>Forgot your password? Enter your login email below. We will send you an email with a link to reset your password.</p>

	<% using( Html.BeginForm() ) { %>
	
        <table>
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
        </table>

        <div>
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Send" ) %>
        </div>
        
	<% } %>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
