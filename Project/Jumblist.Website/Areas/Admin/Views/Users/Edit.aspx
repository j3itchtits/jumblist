<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<User>( "Item" )%>

    <% using ( Html.BeginForm( "save", "users" ) ) { %>

        <%= Html.HiddenFor( m => m.Item.UserId )%>
        <%= Html.HiddenFor( m => m.Item.Password )%>
        
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
            <td><label for="Item.Latitude">Latitude:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Latitude )%>
            <%= Html.ValidationMessageFor( m => m.Item.Latitude )%></td>
        </tr>
        <tr>
            <td><label for="Item.Longitude">Longitude:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Longitude )%>
            <%= Html.ValidationMessageFor( m => m.Item.Longitude )%></td>
        </tr>           
        <tr>
            <td><label for="Item.SearchRadiusMiles">SearchRadiusMiles:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.SearchRadiusMiles )%>
            <%= Html.ValidationMessageFor( m => m.Item.SearchRadiusMiles )%></td>
        </tr> 
        <tr>
            <td><label for="Item.Link">Link:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Link )%>
            <%= Html.ValidationMessageFor( m => m.Item.Link )%></td>
        </tr>
        <tr>
            <td><label for="Item.IsActive">IsActive:</label></td>
            <td><%= Html.CheckBoxFor( m => m.Item.IsActive )%>
            <%= Html.ValidationMessageFor( m => m.Item.IsActive )%></td>
        </tr>
        <tr>
            <td><label for="Item.DateCreated">DateCreated:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.DateCreated, new { @readonly = "true" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.DateCreated )%></td>
        </tr>
        <tr>
            <td><label for="Item.RoleId">RoleId:</label></td>
            <td><%= Html.DropDownListFor( m => m.Item.RoleId, new SelectList( Model.LookupList<Role>(), "RoleId", "Name", Model.Item.RoleId ), "-- Select --" )%>
            <%= Html.ValidationMessageFor( m => m.Item.RoleId )%></td>
        </tr>
        </table>
        
        <p>
            <%= Html.SubmitButton( "submit", "Save" ) %>
        </p>


    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "list") %>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">

    <%= Html.ClientSideValidation<User>( "Reset" )%>
    
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
        
    <% } %>

</asp:Content>

