<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<User>" %>

<%--
<script type="text/javascript">
    $(document).ready(function() {
        $('#demo1').quickEdit();
    });
</script> 
    
<link href="<%= Url.Stylesheet( "jquery.quickedit.0.1.css" )%>" rel="stylesheet" type="text/css"/>
<script src="<%= Url.Script( "jquery.quickedit.0.1.min.js" )%>" type="text/javascript"></script>

<span id="demoText1">This is a jQuery Quick Edit Demo1.</span>
<a href="#" id="demo1" rel="demoText1">edit</a><br /><br />--%>

<b>Location</b><br />


<%
    if (Model != null ) 
    {  
        //string radius = (Model.Search.LocationRadius == 0) ? string.Empty : Model.Search.LocationRadius.ToString();
        string location = ((Model.Search.LocationName).Split( new string[] { ", " }, StringSplitOptions.None ))[0];
        //if (string.IsNullOrEmpty(radius)) Response.Write(Html.Hidden("locationRadius", 0)); %>
        Within <%= Html.TextBox("locationRadius", Model.Search.LocationRadius)%> miles of <%= Html.TextBox( "locationSearch", location ) %><% 
    }
    else
    {
        %><%= Html.Hidden("locationRadius", 0)%><%= Html.Hidden("locationSearch", string.Empty)%><%
    }
%>




       