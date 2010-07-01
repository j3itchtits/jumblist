<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>

    <%= Html.ClientSideValidation<User>( "Item" )%>

    <% using ( Html.BeginForm( "save", "users" ) ) { %>

        <%= Html.HiddenFor( m => m.Item.UserId )%>
        
        <table>
        <tr>
            <td><label for="Item.Name">Name:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Name ) %></td>
            <td><%= Html.ValidationMessageFor( m => m.Item.Name )%></td>
        </tr>
        <tr>
            <td><label for="Item.Email">Email:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Email ) %></td>
            <td><%= Html.ValidationMessageFor( m => m.Item.Email )%></td>
        </tr>
        <tr>
            <td><label for="Item.Postcode">Postcode:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Postcode, new { @class = "text-upper" } )%></td>
            <td><%= Html.ValidationMessageFor( m => m.Item.Postcode )%></td>
        </tr>      
        <tr>
            <td><label for="Item.Radius">Radius:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Radius )%></td>
            <td><%= Html.ValidationMessageFor( m => m.Item.Radius )%></td>
        </tr> 

        </table>
        
        <div>
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Save" ) %>
        </div>


    <% } %>
    
    <p>
        <%=Html.ActionLink( "Back to profile", "profile" ) %>
    </p>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    
    <b>Reset Password</b>
    
    <% using (Html.BeginForm( "savepassword", "users" )) { %>
        
        <%= Html.Hidden( "userid", Model.Item.UserId ) %>
        
        <table>
        <tr>
            <td><label for="Password">Old Password</label></td>
            <td><%= Html.Password( "OldPassword" )%>
            <%= Html.ValidationMessage( "Reset.OldPassword" )%>     </td>       
        </tr>        
        <tr>
            <td><label for="Password">New Password</label></td>
            <td><%= Html.Password( "NewPassword" )%>
            <%= Html.ValidationMessage( "Reset.NewPassword" )%>     </td>       
        </tr>
        <tr>
            <td><label for="ConfirmPassword">Confirm New Password</label></td>
            <td><%= Html.Password( "ConfirmNewPassword" )%>
            <%= Html.ValidationMessage( "Reset.ConfirmNewPassword" )%>  </td>
        </tr>
        </table>
        <p>
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Reset Password" ) %>
        </p>        
        
    <% } %>
    
</asp:Content>
