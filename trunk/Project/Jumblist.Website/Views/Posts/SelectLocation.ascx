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
Within <%= Html.TextBox("locationRadius", Model.SearchRadiusMiles)%> miles of <%= Html.TextBox("locationSearch", Model.SearchLocation)%>



       