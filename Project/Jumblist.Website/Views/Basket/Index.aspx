<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model ) %>
       
    <table>
        <thead><tr>
            <th align="left" colspan="2">Items</th>
        </tr></thead>
        <tbody>
            <% foreach(var item in Model.Basket.Items) { %>
                <tr>
                    <td><%= Html.RouteLink(item.Title, "Post-Detail", new { id = item.PostId, name = item.Title.ToFriendlyUrlEncode() }, new { title = item.Body })%></td>
                    <td>
                        <% using(Html.BeginForm("clearitem", "basket")) { %>
                            <%= Html.Hidden("postId", item.PostId) %>
                            <%= Html.Hidden( "returnUrl", Model.ReturnUrl )%>
                            <input type="submit" value="Remove" />
                        <% } %>
                    </td>                    
                </tr>
            <% } %>
            <tr>
                <td colspan="2" align="right">
                    <% using(Html.BeginForm("clearall", "basket")) { %>
                        <%= Html.Hidden( "returnUrl", Model.ReturnUrl )%>
                        <input type="submit" value="Remove All" />
                    <% } %>
                </td>
            </tr>            
        </tbody>
    </table>
    <p align="center" class="actionButtons">
        <a href="<%= Html.Encode(Model.ReturnUrl) %>">Continue browsing</a>
        <%= Html.ActionLink( "Email Me", "email", new { returnUrl = Request.Url.PathAndQuery } ) %>        
    </p>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
