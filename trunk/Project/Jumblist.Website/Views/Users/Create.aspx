<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	<%= Html.PageTitle( Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( Model, HtmlTextWriterTag.H2 )%>

    <%= Html.MessageBox( Model ) %>

    <%= Html.ClientSideValidation<User>( "User" )%>
        
	<% using( Html.BeginForm() ) { %>
	
        <p>
            <label for="User.Name">Name</label>
            <%= Html.TextBox( "User.Name" )%>
            <%= Html.ValidationMessage( "User.Name" )%>
        </p>
        <p>
            <label for="User.Email">Email</label>
            <%= Html.TextBox( "User.Email" )%>
            <%= Html.ValidationMessage( "User.Email" )%>
        </p>
        <p>
            <label for="User.password">Password</label>
            <%= Html.Password( "User.Password" )%>
            <%= Html.ValidationMessage( "User.Password" )%>            
        </p>
        <p>
            <label for="confirmpassword">Confirm Password</label>
            <%= Html.Password( "confirmpassword" )%>
            <%= Html.ValidationMessage( "User.confirmpassword" )%>  
        </p>
        <p>
            <label for="User.roleid">RoleId</label>
            <%= Html.DropDownList( "User.RoleId", new SelectList( Model.LookupList<Role>(), "RoleId", "Name", Model.Item.RoleId ) )%>
            <%= Html.ValidationMessage( "User.RoleId" )%>  
        </p>
        
        <%= Html.SubmitButton( "submit", "Create" ) %>
        
	<% } %>

</asp:Content>
