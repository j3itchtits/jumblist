<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Jumblist.Model.Entity.Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List of Posts
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List of Posts</h2>
    
    <table cellpadding="5">
    <% foreach ( var post in Model )
       { %>
            <tr class="item">
                <td><%= post.Title %></td>      
                <td><%= post.Url %></td>      
                <td><%= post.Body %></td>  
                <td><%= post.DateTime.ToShortDateString() %></td>
                <td><%= post.CategoryId %></td>
                <td><%= post.Latitude.ToString() %></td>
                <td><%= post.Longitude.ToString() %></td>
                <td><%= post.Display.ToString() %></td>
                <td><%= post.AuthorId.ToString() %></td>
                <td><%= post.FeedId.ToString() %></td>
            </tr>            
    <% } %>
    </table>

</asp:Content>
