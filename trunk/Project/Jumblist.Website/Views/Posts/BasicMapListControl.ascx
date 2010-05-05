<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Pushpin>>" %>


<table>
<%
    foreach ( Pushpin p in Model )
    {
        Response.Write( "<tr><td>" + p.Title + "</td></tr>" );
    }
%>
</table>
