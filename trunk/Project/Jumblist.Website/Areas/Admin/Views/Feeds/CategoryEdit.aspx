<%@ Page Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<FeedCategory>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<FeedCategory>( "Item" )%>

        <% using ( Html.BeginForm( "categorysave", "feeds" ) ) { %>

        <%= Html.HiddenFor( m => m.Item.FeedCategoryId )%>
        
        <table>
        <tr>
            <td><label for="Item.Name">Name:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Name, new { @size = "100" } )%>
            <%= Html.ValidationMessageFor(m => m.Item.Name)%></td>
        </tr>
        </table>
                 
        <p>
            <%= Html.SubmitButton( "submit", "Save" ) %>
        </p>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "categorylist") %>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>

