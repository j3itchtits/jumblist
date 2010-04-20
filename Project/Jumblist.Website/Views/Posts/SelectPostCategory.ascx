<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<PostCategory>" %>




<b>Category</b><br />
<% 
    SelectListItem all = new SelectListItem() { Text = "All", Value = "", Selected = true };
    SelectListItem offered = new SelectListItem() { Text = "Offered", Value = "offered", Selected = false };
    SelectListItem wanted = new SelectListItem() { Text = "Wanted", Value = "wanted", Selected = false };
    var categories = new[] { all, offered, wanted };
    var categories1 = new[] { "All", "Offered", "Wanted" };
    %>
    
<%--<%= Html.DropDownList( "postCategorySearch", new SelectList( categories ) ) %>
--%>
<%= Html.DropDownList( "postCategorySearch", new SelectList( categories1, Model.Name ) ) %>
       