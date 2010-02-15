<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<TestViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Html.Encode( Model.PageTitle ) %></h2>
    
    <p><%= Model.HttpResponse %></p>
    
    <div id="itemsList">
        <table class="list">
        <% foreach (var post in Model.Feed.Items)
           { %>
                <tr class="item">
                    <td><%= post.Title.Text%></td>  
                    <td><a href="<%= post.Links[0].Uri.ToString() %>">Link</a></td>
                    <td><%= post.PublishDate.LocalDateTime %></td>
                    <td><%= post.LastUpdatedTime.LocalDateTime %></td>
                    <td><pre><%= post.Summary.Text %></pre></td>
                </tr>            
        <% } %>
        </table>
    </div>

</asp:Content>  

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    tESTING
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
