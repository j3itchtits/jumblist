<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<User>( "Item" )%>

    <% using ( Html.BeginForm( "save", "users" ) ) { %>

        <%= Html.Hidden( "id", Model.Item.UserId )%>
        <%= Html.HiddenFor( m => m.Item.UserId )%>
        
        <table>
        <tr>
            <td><label for="Item.Name">Name:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Name ) %>
            <%= Html.ValidationMessageFor( m => m.Item.Name )%></td>
        </tr>
        <tr>
            <td><label for="Item.Email">Email:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Email ) %>
            <%= Html.ValidationMessageFor( m => m.Item.Email )%></td>
        </tr>
        <tr>
            <td><label for="Item.Postcode">Postcode:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Postcode, new { @class = "text-upper" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.Postcode )%></td>
        </tr>      
        <tr>
            <td><label for="Item.Radius">Radius:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Radius )%>
            <%= Html.ValidationMessageFor( m => m.Item.Radius )%></td>
        </tr> 

        </table>
        
        <p>
            <%= Html.SubmitButton( "submit", "Save" ) %>
        </p>


    <% } %>

<%--    <%= Html.ClientSideValidation<User>( "Reset" )%>
    
    <b>Reset Password</b>
    
    <% using (Html.BeginForm( "resetuserpassword", "users" )) { %>
        
        <%= Html.Hidden( "userid", Model.Item.UserId ) %>
        
        <table>
        <tr>
            <td><label for="Password">Password</label></td>
            <td><%= Html.Password( "Password" )%>
            <%= Html.ValidationMessage( "Reset.Password" )%>     </td>       
        </tr>

        <tr>
            <td><label for="ConfirmPassword">Confirm Password</label></td>
            <td><%= Html.Password( "ConfirmPassword" )%>
            <%= Html.ValidationMessage( "Reset.ConfirmPassword" )%>  </td>
        </tr>
        </table>
        <p>
            <%= Html.SubmitButton( "submit", "Reset Password" ) %>
        </p>        
        
    <% } %>--%>
    
    <p>
        <%=Html.ActionLink( "View alerts", "alerts" ) %>
    </p>
    
    <p>
        <%=Html.ActionLink( "Back to profile", "profile" ) %>
    </p>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">


    
</asp:Content>
