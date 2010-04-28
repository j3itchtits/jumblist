<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 
<head> 
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" /> 
    <title>Tabs</title> 

    <style type="text/css" media="screen"> 
    <!--
		BODY { margin: 10px; padding: 0; font: 1em "Trebuchet MS", verdana, arial, sans-serif; font-size: 100%; }
		H1 { margin-bottom: 2px; font-family: Garamond, "Times New Roman", Times, Serif;}
		DIV.container { margin: auto; width: 90%; margin-bottom: 10px;}
		TEXTAREA { width: 80%;}
		FIELDSET { border: 1px solid #ccc; padding: 1em; margin: 0; }
		LEGEND { color: #ccc; font-size: 120%; }
		INPUT, TEXTAREA { font-family: Arial, verdana; font-size: 125%; padding: 7px; border: 1px solid #999; }
		LABEL { display: block; margin-top: 10px; } 
		IMG { margin: 5px; }
 
		UL.tabNavigation {
		    list-style: none;
		    margin: 0;
		    padding: 0;
		}
 
		UL.tabNavigation LI {
		    display: inline;
		}
 
		UL.tabNavigation LI A {
		    padding: 3px 5px;
		    background-color: #ccc;
		    color: #000;
		    text-decoration: none;
		}
 
		UL.tabNavigation LI A.selected,
		UL.tabNavigation LI A:hover {
		    background-color: #333;
		    color: #fff;
		    padding-top: 7px;
		}
		
		UL.tabNavigation LI A:focus {
			outline: 0;
		}
 
		div.tabs > div {
			padding: 5px;
			margin-top: 3px;
			border: 5px solid #333;
		}
		
		div.tabs > div h2 {
			margin-top: 0;
		}
 
		#first {
		    background-color: #f00;
		}
 
		#second {
		    background-color: #0f0;
		}
 
		#third {
		    background-color: #00f;
		}
		
		.waste {
			min-height: 1000px;
		}
    -->
    </style> 

    <script src="<%= Url.Script( "jquery-1.3.2.min.js" )%>" type="text/javascript"></script> 
	<script type="text/javascript" charset="utf-8"> 
		$(function () {
			var tabContainers = $('div.tabs > div');
			tabContainers.hide().filter(':first').show();
			
			$('div.tabs ul.tabNavigation a').click(function () {
				tabContainers.hide();
				tabContainers.filter(this.hash).show();
				$('div.tabs ul.tabNavigation a').removeClass('selected');
				$(this).addClass('selected');
				return false;
			}).filter(':first').click();
		});
	</script> 
</head> 
<body id="page"> 
    <div class="tabs"> 
        <ul class="tabNavigation"> 
            <li><a href="#first">First</a></li> 
            <li><a href="#second">Second</a></li> 
        </ul> 
        <div id="first"> 
            <h2>First</h2> 
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> 
        </div> 
        <div id="second"> 
 
            <h2>Second</h2> 
            <div id="map_canvas" style="width:800px;height:400px;border: 1px solid black;"></div>
            <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>  
            <script type='text/javascript'>
                //var G4440936 = null;
                //$(function() { G4440936 = new MvcMaps.GoogleMap('divG4440936', { id: 'G4440936', lat: 50.853544, lng: 0.56347, zoom: 9, maptype: G_NORMAL_MAP, pushpins: [{ lat: 50.853544, lng: 0.56347, imagesize: { w: 0, h: 0} }, { lat: 50.83, lng: 0.57, imagesize: { w: 0, h: 0}}] }); });
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
	<div class="waste"></div> 
  </body> 
</html> 
 
 
 
 
 