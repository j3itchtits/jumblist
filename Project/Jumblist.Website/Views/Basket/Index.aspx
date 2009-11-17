<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Model.Entity.Basket>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    Your Basket
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

<h2>Your basket</h2>
       
    <table>
        <thead><tr>
            <th align="left" colspan="2">Items</th>
        </tr></thead>
        <tbody>
            <% foreach(var item in Model.Items) { %>
                <tr>
                    <td><%= item.Title %></td>
                    <td>
                        <% using(Html.BeginForm("clearitem", "basket")) { %>
                            <%= Html.Hidden("postId", item.PostId) %>
                            <%= Html.Hidden("returnUrl", ViewData["returnUrl"]) %>
                            <input type="submit" value="Remove" />
                        <% } %>
                    </td>                    
                </tr>
            <% } %>
            <tr>
                <td colspan="2" align="right">
                    <% using(Html.BeginForm("clearall", "basket")) { %>
                        <%= Html.Hidden("returnUrl", ViewData["returnUrl"]) %>
                        <input type="submit" value="Remove All" />
                    <% } %>
                </td>
            </tr>            
        </tbody>
    </table>
    <p align="center" class="actionButtons">
        <a href="<%= Html.Encode(ViewData["returnUrl"]) %>">Continue browsing</a>
        <%= Html.ActionLink( "Email Me", "emailbasket", new { returnUrl = Request.Url.PathAndQuery } ) %>        
    </p>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
