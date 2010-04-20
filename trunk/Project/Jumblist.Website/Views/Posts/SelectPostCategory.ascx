<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<PostCategory>" %>




<b>Category</b><br />
<% 
    SelectListItem all = new SelectListItem() { Text = "All", Value = "" };
    SelectListItem offered = new SelectListItem() { Text = "Offered", Value = "offered" };
    SelectListItem wanted = new SelectListItem() { Text = "Wanted", Value = "wanted" };
    var categories = new[] { all, offered, wanted };
    %>
    
<%--<%= Html.DropDownList( "postCategorySearch", new SelectList( categories ) ) %>
--%>
<%= Html.DropDownList( "postCategorySearch", new SelectList( categories, "Value", "Text", Model.Name ) )%>
       