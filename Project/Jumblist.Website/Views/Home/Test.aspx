<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TestViewModel<System.ServiceModel.Syndication.SyndicationFeed>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Html.Encode( Model.PageTitle ) %></h2>
    
    <div id="itemsList">
        <table class="list">
        <% foreach ( var post in Model.Item.Items )
           { %>
                <tr class="item">
                    <td><%= post.Title.Text%></td>  
                    <td><a href="<%= post.Links[0].Uri.ToString() %>">Link</a></td>
                    <td><%= post.PublishDate.LocalDateTime %></td>
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
