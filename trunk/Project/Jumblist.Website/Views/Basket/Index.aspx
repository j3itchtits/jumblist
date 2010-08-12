<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Html.PageTitle( ViewData.Model )%></h2>
    
    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>
       
    <table>
        <thead><tr>
            <th align="left">Items</th>
        </tr></thead>
        <tbody>
            <tr>
            <td>
                <div id="basket-items">
                    <% Html.RenderPartial( "BasketItemsControl", Model.Basket.Items ); %>
                </div>
            </td>
            </tr>
            <tr>
                <td align="right">
                    <%= Html.ActionLink( "Remove All", "removeall", new { returnUrl = Model.ReturnUrl } ) %>
                </td>
            </tr>            
        </tbody>
    </table>
    
    <div>
        <a href="<%= Html.Encode( Model.ReturnUrl ) %>">Continue browsing</a>
        <%= Html.ActionLink( "Email Me", "email", new { returnUrl = Model.ReturnUrl } ) %>   
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
