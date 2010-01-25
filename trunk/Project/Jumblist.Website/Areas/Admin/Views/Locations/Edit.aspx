<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Location>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<Location>( "Item" )%>

        <% using ( Html.BeginForm( "save", "locations" ) ) { %>

        <%= Html.HiddenFor( m => m.Item.LocationId )%>
        <%= Html.HiddenFor( m => m.Item.ParentId )%>
        
        <table>
        <tr>
            <td><label for="Item.Name">Name:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Name, new { @size = "100" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.Name )%></td>
        </tr>
        <tr>
            <td><label for="Item.LocationCategoryId">Location Category:</label></td>
            <td><%= Html.DropDownListFor( m => m.Item.LocationCategoryId, new SelectList( Model.LookupList<LocationCategory>(), "LocationCategoryId", "Name", Model.Item.LocationCategoryId ), "-- Select --" )%>
            <%= Html.ValidationMessageFor( m => m.Item.LocationCategoryId )%></td>
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
</asp:Content>

