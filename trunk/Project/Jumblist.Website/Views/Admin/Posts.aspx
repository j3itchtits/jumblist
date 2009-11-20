<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Jumblist.Data.Entity.Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Admin : All Posts</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>All posts</h2>
    
    <table class="grid">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Actions</th>
        </tr>
        <% foreach (var item in Model) { %>
            <tr>
                <td><%= item.PostId %></td>
                <td><%= Html.Encode( item.Title ) %></td>
                <td>
                    <%= Html.ActionLink( "Edit", "postedit", new { item.PostId } )%>
                    <%= Html.ActionLink( "Delete", "postdelete", new { item.PostId } )%>
                </td>
            </tr>
        <% } %>
    </table>
    
    <p><%= Html.ActionLink("Add a new post", "Create")%></p>

</asp:Content>


