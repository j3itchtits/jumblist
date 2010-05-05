<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>About</h2>
    
    <form name="arse" action="/home/submitabout" method="post">
    <input type="text" name="formInput"/>
    <a href="javascript:this.form.submit();">Submit</a>
    </form>
    
    <% using ( Html.BeginForm( "submitabout", "home" ) )
       { %>
            <input type="text" name="formInput" />
            <input type="submit" value="dotNet Save" />  <%
       } %>
    


    <%--<input type="submit" value="Normal Save" />--%>
    
    Form submission = <%= ViewData["formInput"] %><br/><br/>
        
    <%= ("baby car tramp".Split( ' ' )).Count() + "<br/>"%>
    
    Clean Search String: <%= ("baby,arse or car tramp").ToCleanSearchString() + "<br/>" %>
    
    Ordered Search String: <%= ("baby arse car tramp").Split( ' ' ).OrderBy( s => s ).ToFormattedStringList( "{0} ", 1 ) + "<br/>" %>
    
    <%  foreach (var item in ("baby car tramp".Split( new char[]{ ' ' }, 1 ) ))
	{
        Response.Write( item + "<br/>" );
	}
        Response.Write( "<br/>" );
        %>
    
    <%= Regex.IsMatch( "baby\nclothes\nhat\ngirl\nbed\nbaby girl", "baby clothes", RegexOptions.IgnoreCase | RegexOptions.Multiline ).ToString()%><br /><br />
    
    <% 
        double i = new Random().Next( -10, 10 );
        i = i / 1000;
        double g = 0.2334;
        %>
    <%= i %><br />
    <%= g %><br />

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>