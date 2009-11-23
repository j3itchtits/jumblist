<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Jumblist.Data.Entity.Tag>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Admin : All Tags</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>All tags</h2>
    
    <table class="grid">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Actions</th>
        </tr>
        <% foreach (var item in Model) { %>
            <tr>
                <td><%= item.TagId %></td>
                <td><%= Html.Encode( item.Name ) %></td>
                <td>
                    <%= Html.ActionLink( "Edit", "edittag", new { item.TagId } )%>
                    <%= Html.ActionLink( "Delete", "edittag", new { item.TagId } )%>
                </td>
            </tr>
        <% } %>
    </table>
    
    <p><%= Html.ActionLink("Add a new tag", "create")%></p>

</asp:Content>


