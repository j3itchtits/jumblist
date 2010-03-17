<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MapDisplay.ascx.cs" Inherits="Jumblist.Website.Views.Shared.MapDisplay" %>
<table>
    <tr>
        <%
        var bingMap = (MvcMaps.IMap)ViewData["Bing"];
        if (bingMap != null)
        { %>
        <td>
            <h3>Bing Maps</h3>
            <% if (ViewData["BingHeader"] != null)
               {
                   %><%=ViewData["BingHeader"]%><%
               }
            %>
            <% bingMap.Render(); %>
        </td>
        <% } %>
        
        <%
        var googleMap = (MvcMaps.IMap)ViewData["Google"];
        if (googleMap != null)
        { %>
        <td>
            <h3>Google Maps</h3>
             <% if (ViewData["GoogleHeader"] != null)
               {
                   %><%=ViewData["GoogleHeader"]%><%
               }
            %>
            <% googleMap.Render(); %>
        </td>
        <% } %>
    </tr>
</table>