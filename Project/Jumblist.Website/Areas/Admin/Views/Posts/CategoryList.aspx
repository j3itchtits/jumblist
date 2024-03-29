﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<PostCategory>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Model.PageTitle %>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model )%>
    
    <div id="itemsList">

        <table cellpadding="5" border="0">
        <% foreach ( var category in Model.List ) { %>
                <tr class="item">
                    <td><%= category.Name%></td> 
                    <td><%= Html.ActionLink( "Edit", "categoryedit", new { id = category.PostCategoryId } )%></td> 
                    <td><%= Html.ActionLink( "List Posts", "listbycategory", new { id = category.PostCategoryId } )%></td> 
                </tr>            
        <% } %>
        </table>

    </div>
    
    <p>
        <%= Html.ActionLink( "Create", "categorycreate" )%>
    </p> 
    
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">


</asp:Content>