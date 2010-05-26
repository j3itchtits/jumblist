<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MapTest</title>
    <link href="<%= Url.Stylesheet( "yui-reset.css" )%>" rel="stylesheet" type="text/css"/>
    <link href="<%= Url.Stylesheet( "yui-reset.css" )%>" rel="stylesheet" type="text/css"/>
    <link href="<%= Url.Stylesheet( "yui-fonts-min.css" )%>" rel="stylesheet" type="text/css"/>
    <link href="<%= Url.Stylesheet( "jumblist.css" )%>" rel="stylesheet" type="text/css"/>
    <script src="<%= Url.Script( "jquery-1.3.2.min.js" )%>" type="text/javascript"></script>
    
    <link href="<%= Url.Stylesheet( "ui.tabs.css" )%>" rel="stylesheet" type="text/css"/>
    <script src="<%= Url.Script( "jquery-ui-1.7.2.custom.min.js" )%>" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#tabs').tabs();
        });
    </script>
    
    
</head>
<body>



	<div id="tabs">
		
		<ul>
			<li><a href="#tabs-1">Listing</a></li>
			<li><a href="#tabs-2">Map</a></li>
		</ul>
		
		<div id="tabs-1">

			<p><font face="Arial, Helvetica, sans-serif" color="#000" size="2">Dear all,</p>

			<p><font face="Arial, Helvetica, sans-serif" color="#000" size="2">As you are aware, our P&T recruitment campaign has now launched with online media going live on timesonline.co.uk and ft.com, as well as print adverts in the Financial Times and The Sunday Times. We have already seen a number of applications, both for P&T and for other business areas within KPMG.</p>

			<p><font face="Arial, Helvetica, sans-serif" color="#000" size="2">This is just the start of a large-scale campaign to recruit 250 people into Performance and Technology in the UK. Over the next few months there will also be billboards at Waterloo, London Bridge, Birmingham, Manchester and Leeds, poster sites at Heathrow and City airports as well as advertising on the Heathrow Express.</p>

			<p><font face="Arial, Helvetica, sans-serif" color="#000" size="2">With new vacancies at KPMG across a range of grades and business areas, now is the ideal time to refer a friend to KPMG. Through our Connections referral scheme, you can be eligible for a reward of up to &pound;7,500 if you refer someone who goes on to join KPMG. To find out more, <a href="https://portal.ema.kworld.kpmg.com/europe/HR/Recruitment/Pages/ConnectionsScheme.aspx">click here</a>.</p>

			<p><font face="Arial, Helvetica, sans-serif" color="#000" size="2">To make it easier to refer someone, the recruitment team has developed an iGoogle application. The iGoogle gadget gives you a current list of the latest vacancies, which will save you having to search through all jobs within KPMG.</p>

			<p><font face="Arial, Helvetica, sans-serif" color="#000" size="2">If you would like to be rewarded for referring someone, or you're thinking about moving internally, why not download the iGoogle gadget? Simply follow the steps on the <a href="http://www.kpmgcareers.co.uk/default.aspx?pg=8051">iGoogle gadget page</a>.</p>

			<p><font face="Arial, Helvetica, sans-serif" color="#000" size="2">Best regards,<br/>Scott Parker</p>
            
		</div>
		
		<div id="tabs-2">

            <div id="map_canvas" style="width:800px;height:400px;border: 1px solid black;"></div>
            <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>  
            <script type="text/javascript">
                var latlng = new google.maps.LatLng(51.497, 0.001);
                var myOptions = {
                    zoom: 12,
                    center: latlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map,
                    title: "Hello World!"
                });          
            </script> 
    
		</div>
	</div>
</body>
</html>
