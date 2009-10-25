<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Jumblist.Model.Entity.Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List of Posts
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List of Posts</h2>
    
    <% foreach ( var post in Model )
       { %>
            <div class="item">
                <h3><%= post.PostTitle %></h3>      
                <p><%= post.PostUrl %></p>      
            </div>            
    <% } %>
    

</asp:Content>
