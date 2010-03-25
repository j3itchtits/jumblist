<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>Hello AdminPage</h2>

   
    <%
        var myString = "&quot;Steven&quot; &lt;stevenpaul_uk2000@...&gt;Mon Feb&nbsp;8,&nbsp;2010 8:16&nbsp;pm";
        myString = Regex.Replace( myString, "(.*)&gt;", String.Empty );

        var anotherString = "hello";
        Response.Write(anotherString.AlterIfNotNullOrEmpty("well ", null) + "<br/><br/>");
        var dt = DateTime.Parse( HttpUtility.HtmlDecode( myString ) );
        Response.Write( dt.ToString() + "<br/><br/>" );

        //Response.Write( Regex.IsMatch( "Availabl rye in st leonards", @"\bSt Leonards\b", RegexOptions.IgnoreCase ).ToString() );
        Response.Write( "Postcode match t: " + Regex.IsMatch( "afasdf tn31 6hg dafdfasdfs", StringExtensions.UKPostcodeRegex, RegexOptions.IgnoreCase ) + "<br/><br/>" );
        Response.Write(StringExtensions.IsSingularOrPluralPhraseRegexMatch("I have some nappies-buckets to give aways ", "Nappy", RegexOptions.IgnoreCase).ToString() + "<br/><br/>");
        Response.Write( "Bexhill : " + Regex.IsMatch( "available in the (Bexhill] area", @"\b" + "Bexhill" + @"\b", RegexOptions.IgnoreCase ) + "<br/><br/>" );
        Response.Write("Replace text : " + Regex.Replace("helo there...&gt;This is working now", @"(.*)&gt;", string.Empty) + "<br/><br/>");
        Response.Write( ("i am based in St Leonard's").Replace( "'", string.Empty ) + "<br/><br/>" );
        Response.Write(Regex.IsMatch("Received: a bit nappy", "(Recieved|Received)", RegexOptions.IgnoreCase) + "<br/><br/>");
        Response.Write(StringExtensions.IsPhraseRegexMatch("TN37ssadf dasf asdf", "TN37.*", RegexOptions.IgnoreCase) + "<br/><br/>");
        Response.Write(Regex.IsMatch("TN13", @"^[A-Z]{1,2}[0-9]{1,2}$", RegexOptions.IgnoreCase) + "<br/><br/>");
        string locationName = "Bexhill, East Sussex";
        string[] locationNameArray = locationName.Split( new string[] { ", " }, StringSplitOptions.None );
        string locationNameAreaOfTown = locationNameArray[1];
        Response.Write( locationNameAreaOfTown + "<br/><br/>" );
        Response.Write( (true || false).ToString() + "<br/><br/>" );

         %>
             
    <p>London weather: <%= HttpContext.Current.Items["Temp"] %></p>
    
    <% 
        //var bingLocationService = new StuartClode.Mvc.Service.Bing.BingLocationService( "The Ridge, Hastings, East Sussex, United Kingdom" ); 
        //Response.Write( bingLocationService.Latitude + "<br/><br/>" );
        //Response.Write( bingLocationService.Longitude + "<br/><br/>" );
        
        %>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
