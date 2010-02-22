<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>Hello AdminPage</h2>

    <%
        var myString = "&quot;Steven&quot; &lt;stevenpaul_uk2000@...&gt;Mon Feb&nbsp;8,&nbsp;2010 8:16&nbsp;pm";
        myString = Regex.Replace( myString, "(.*)&gt;", String.Empty );

        var dt = DateTime.Parse( HttpUtility.HtmlDecode( myString ) );
        Response.Write( dt.ToString() + "<br/><br/>" );

        //Response.Write( Regex.IsMatch( "Availabl rye in st leonards", @"\bSt Leonards\b", RegexOptions.IgnoreCase ).ToString() );
        Response.Write(RegexExtensions.IsSingularOrPluralPhraseMatch("I have some nappies-buckets to give aways ", "Nappy", RegexOptions.IgnoreCase).ToString() + "<br/><br/>");
        Response.Write( ("i am based in St Leonard's").Replace( "'", string.Empty ) + "<br/><br/>" );
        Response.Write(Regex.IsMatch("Received: a bit nappy", "(Recieved|Received)", RegexOptions.IgnoreCase) + "<br/><br/>");
        Response.Write( RegexExtensions.IsPhraseMatch( "TN37ssadf dasf asdf", "TN37.*", RegexOptions.IgnoreCase ) + "<br/><br/>" );
        Response.Write(Regex.IsMatch("TN13", @"^[A-Z]{1,2}[0-9]{1,2}$", RegexOptions.IgnoreCase) + "<br/><br/>");
         %>
             
    <p>London weather: <%= HttpContext.Current.Items["Temp"] %></p>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
