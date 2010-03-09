<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	About
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>About</h2>
    
    <%= ("baby car tramp".Split( ' ' )).Count() + "<br/>"%>
    
    Clean Search String: <%= ("baby,arse or car tramp").ToCleanSearchString() + "<br/>" %>
    
    Ordered Search String: <%= ("baby arse car tramp").Split( ' ' ).OrderBy( s => s ).ToFormattedStringList( "{0} ", 1 ) + "<br/>" %>
    
    <%  foreach (var item in ("baby car tramp".Split( new char[]{ ' ' }, 1 ) ))
	{
        Response.Write( item + "<br/>" );
	}
        Response.Write( "<br/>" );
        %>
    
    <%= Regex.IsMatch( "baby\nclothes\nhat\ngirl\nbed\nbaby girl", "baby clothes", RegexOptions.IgnoreCase | RegexOptions.Multiline ).ToString()%>



</asp:Content>
