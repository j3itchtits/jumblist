<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Tag>>" %>

<% %>
    <table cellpadding="5" border="1" width="100%">
    <tr><td>Tags</td></tr>
    <% foreach ( var tag in Model ) { %>
            <tr class="item">
                <td><%= tag.Name %></td>
            </tr>            
    <% } %>
    </table>