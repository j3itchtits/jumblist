<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Jumblist.Data.Entity.Temp>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Admin : All Tags</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>All temp</h2>
    
    <table class="grid">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Actions</th>
        </tr>
        <% foreach (var item in Model) { %>
            <tr>
                <td><%= item.TempId %></td>
                <td><%= Html.Encode( item.Name ) %></td>
                <td>
                    <%= Html.ActionLink( "Edit", "edittemp", new { item.TempId } )%>
                    <%= Html.ActionLink( "Delete", "edittemp", new { item.TempId } )%>
                </td>
            </tr>
        <% } %>
    </table>
    
    <p><%= Html.ActionLink("Add a new temp", "createtemp")%></p>

</asp:Content>


