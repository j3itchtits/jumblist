<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model ) %>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm( "save", "users" )) {%>

        <%= Html.Hidden("UserId", Model.Item.UserId) %>

        <p>
            <label for="Name">Name:</label>
            <%= Html.TextBox( "Name", Model.Item.Name )%>
            <%= Html.ValidationMessage("Name", "*") %>
        </p>
        <p>
            <label for="EmailHttpLink">Email:</label>
            <%= Html.TextBox( "Email", Model.Item.Email )%>
            <%= Html.ValidationMessage( "Email", "*" )%>
        </p>
        <p>
            <label for="EmailHttpLink">Password:</label>
            <%= Html.TextBox( "Password", Model.Item.Password )%>
            <%= Html.ValidationMessage( "Password", "*" )%>
        </p>            
        <p>
            <label for="Profile">Link:</label>
            <%= Html.TextBox( "Link", Model.Item.Link )%>
            <%= Html.ValidationMessage( "Link", "*" )%>
        </p>
        <p>
            <label for="Profile">IsActive:</label>
            <%= Html.CheckBox( "IsActive", Model.Item.IsActive )%>
            <%= Html.ValidationMessage( "IsActive", "*" )%>
        </p>
        <p>
            <label for="Profile">DateCreated:</label>
            <%= Html.TextBox( "DateCreated", Model.Item.DateCreated )%>
            <%= Html.ValidationMessage( "DateCreated", "*" )%>
        </p>
        <p>
            <label for="Profile">RoleId:</label>
            <%= Html.DropDownList( "RoleId", new SelectList( Model.LookupList<Role>(), "RoleId", "Name", Model.Item.RoleId ), string.Empty )%>
            <%= Html.ValidationMessage( "RoleId", "*" )%>
        </p>
        <p>
            <input type="submit" value="Save" />
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
</asp:Content>

