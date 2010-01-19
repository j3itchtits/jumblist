<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<User>( "Item" )%>

    <% using ( Html.BeginForm<UsersController>( u => u.Save(null) ) ) { %>

        <%= Html.HiddenFor( m => m.Item.UserId )%>
        <%= Html.HiddenFor( m => m.Item.Password )%>
        
        <p>
            <label for="Item.Name">Name:</label>
            <%= Html.TextBoxFor( m => m.Item.Name ) %>
            <%= Html.ValidationMessageFor( m => m.Item.Name )%>
        </p>
        <p>
            <label for="Item.Email">Email:</label>
            <%= Html.TextBoxFor( m => m.Item.Email ) %>
            <%= Html.ValidationMessageFor( m => m.Item.Email )%>
        </p>
        <p>
            <label for="Item.Postcode">Postcode:</label>
            <%= Html.TextBoxFor( m => m.Item.Postcode ) %>
            <%= Html.ValidationMessageFor( m => m.Item.Postcode )%>
        </p>      
        <p>
            <label for="Item.SearchRadiusMiles">SearchRadiusMiles:</label>
            <%= Html.TextBoxFor( m => m.Item.SearchRadiusMiles )%>
            <%= Html.ValidationMessageFor( m => m.Item.SearchRadiusMiles )%>
        </p> 
        <p>
            <label for="Item.Link">Link:</label>
            <%= Html.TextBoxFor( m => m.Item.Link )%>
            <%= Html.ValidationMessageFor( m => m.Item.Link )%>
        </p>
        <p>
            <label for="Item.IsActive">IsActive:</label>
            <%= Html.CheckBox( "Item.IsActive" )%>
            <%= Html.ValidationMessageFor( m => m.Item.IsActive )%>
        </p>
        <p>
            <label for="Item.DateCreated">DateCreated:</label>
            <%= Html.TextBoxFor( m => m.Item.DateCreated, new { @readonly = "true" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.DateCreated )%>
        </p>
        <p>
            <label for="Item.RoleId">RoleId:</label>
            <%= Html.DropDownListFor( m => m.Item.RoleId, new SelectList( Model.LookupList<Role>(), "RoleId", "Name", Model.Item.RoleId ) )%>
            <%= Html.ValidationMessageFor( m => m.Item.RoleId )%>
        </p>
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
    
    <% using ( Html.BeginForm<UsersController>( u => u.ResetUserPassword( Model.Item.UserId, null, null ) ) ) { %>
        <p>
            <label for="Password">Password</label>
            <%= Html.Password( "Password" )%>
            <%= Html.ValidationMessage( "Reset.Password" )%>            
        </p>

        <p>
            <label for="ConfirmPassword">Confirm Password</label>
            <%= Html.Password( "ConfirmPassword" )%>
            <%= Html.ValidationMessage( "Reset.ConfirmPassword" )%>  
        </p>
        <p>
            <%= Html.SubmitButton( "submit", "Reset Password" ) %>
        </p>        
    <% } %>

</asp:Content>

