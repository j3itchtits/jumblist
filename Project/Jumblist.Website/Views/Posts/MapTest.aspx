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

        /*
        * MvcMaps Preview 1 - A Unified Mapping API for ASP.NET MVC
        * Copyright (c) 2009 Chris Pietschmann
        * http://mvcmaps.codeplex.com
        * Licensed under the Microsoft Reciprocal License (Ms-RL)
        * http://mvcmaps.codeplex.com/license
        */
        (function() {

            var $ns = function(n) {
                var nsparts = n.split('.');
                var r = window;
                for (var i = 0; i < nsparts.length; i++) {
                    var ns = r[nsparts[i]];
                    if (!ns) {
                        ns = r[nsparts[i]] = {};
                    }
                    r = ns;
                }
            };

            $ns("MvcMaps");

            MvcMaps.registerNamespace = $ns;

            if (!MvcMaps.MapBase) {
                var $MapBase = MvcMaps.MapBase = function(divid, options) { };
                $MapBase.prototype = $MapBase.fn = {
                    id: null,
                    divId: null,
                    mapObject: null,
                    init: function(divid, options) {
                        throw "Not Implemented";
                    },

                    getCenter: NotImplemented,
                    getZoom: NotImplemented,

                    //            setCenter: NotImplemented,
                    //            setZoom: NotImplemented,

                    setupDynamicMap: function(options) {
                        var that = this;
                        this.dynamicMapOptions = options;
                        this.attachDynamicMapLoadEvents(options);
                        if (options.autoload === true) {
                            window.setTimeout(function() { that.loadDynamicMapData(); }, 100);
                        }
                    },
                    attachDynamicMapLoadEvents: NotImplemented,
                    getDynamicMapViewData: NotImplemented,

                    loadDynamicMapData: function() {
                        var that = this;
                        jQuery.post(
                    this.dynamicMapOptions.url,
                    this.getDynamicMapViewData(),
                    function(data) {
                        if (that.dynamicMapOptions.displaydata !== undefined && typeof (that.dynamicMapOptions.displaydata) === "function") {
                            that.dynamicMapOptions.displaydata.apply(that, [data]);
                        } else {
                            if (data.code !== 200) {
                                alert(data.message + " (" + data.code + ")");
                            } else {
                                that.clearDynamicMapData();
                                that.plotPushpins(data.pushpins);
                                if (that.dynamicMapOptions.dataloaded !== undefined) {
                                    if (typeof (that.dynamicMapOptions.dataloaded) === "function") {
                                        that.dynamicMapOptions.dataloaded.apply(that, [data]);
                                    }
                                }
                            }
                        }
                    }, "json");
                    },

                    clearDynamicMapData: NotImplemented,
                    plotPushpins: NotImplemented,
                    plotPolylines: NotImplemented,
                    plotPolygons: NotImplemented
                };
            }

            $ns("MvcMaps.Utils");
            MvcMaps.Utils.GetLowest = function(a, b) {
                return (a < b ? a : b);
            };

            MvcMaps.Utils.GetHighest = function(a, b) {
                return (a > b ? a : b);
            };


            function NotImplemented() {
                throw "Not Implemented";
            }

        })();



        /*
        * MvcMaps Preview 1 - A Unified Mapping API for ASP.NET MVC
        * Copyright (c) 2009 Chris Pietschmann
        * http://mvcmaps.codeplex.com
        * Licensed under the Microsoft Reciprocal License (Ms-RL)
        * http://mvcmaps.codeplex.com/license
        */
        (function($mvc) {
            if (!$mvc.GoogleMap) {

                var $map = $mvc.GoogleMap = function(divid, options) {
                    return new $map.fn.init(divid, options);
                };
                $map.prototype = $map.fn = new $mvc.MapBase;

                $map.fn.init = function(divid, options) {
                    var opts = options;
                    var that = this;

                    this.id = options.id;
                    this.divId = divid;

                    var map = this.mapObject = new GMap2($("#" + divid)[0]);

                    GEvent.addListener(map, "load", function() {
                        if (opts.onLoad) {
                            opts.onLoad.apply(that, arguments);
                        }

                        if (opts.dynamicmap) {
                            that.setupDynamicMap(opts.dynamicmap);
                        }
                    });

                    //addition
                    if (options.pushpins) {
                        var bounds = new GLatLngBounds();
                        for (var i = 0; i < options.pushpins.length; i++) {
                            bounds.extend(new GLatLng(options.pushpins[i].lat, options.pushpins[i].lng));
                        }
                    }
                    //end addition  
                    
                    //edit
                    map.setCenter(
                        (options.lat && options.lng ? new GLatLng(options.lat, options.lng) : bounds.getCenter()), //new GLatLng(37.4419, -122.1419)
                        (options.zoom ? options.zoom : map.getBoundsZoomLevel(bounds)),
                        (options.maptype ? options.maptype : null)
                    );
                    //end edit

                    if (options.fixed === true) {
                        map.disableDragging();
                    } else {
                        map.setUIToDefault();
                    }

                    if (options.pushpins) {
                        this.plotPushpins(options.pushpins);
                    }

                    if (options.polylines) {
                        this.plotPolylines(options.polylines);
                    }

                    if (options.polygons) {
                        this.plotPolygons(options.polygons);
                    }
                };

                $map.fn.clearDynamicMapData = function() {
                    this.mapObject.clearOverlays();
                };

                $map.fn.plotPushpins = function(pushpins) {
                    var len = pushpins.length;
                    for (var i = 0; i < len; i++) {
                        $plotPushpin.apply(this, [pushpins[i]]);
                    }
                };

                $map.fn.plotPolylines = function(polylines) {
                    var len = polylines.length;
                    for (var i = 0; i < len; i++) {
                        $plotPolyline.apply(this, [polylines[i]]);
                    }
                };

                $map.fn.plotPolygons = function(polygons) {
                    var len = polygons.length;
                    for (var i = 0; i < len; i++) {
                        $plotPolygon.apply(this, [polygons[i]]);
                    }
                };

                function $plotPolyline(polyline) {
                    var points = [];
                    for (var pi = 0; pi < polyline.points.length; pi++) {
                        var p = polyline.points[pi];
                        points.push(new GLatLng(p.lat, p.lng));
                    }

                    var poly = new GPolyline(
                        points,
                        (polyline.linecolor ? polyline.linecolor : null),
                        (polyline.lineweight !== undefined ? polyline.lineweight : null),
                        (polyline.lineopacity !== undefined ? polyline.lineopacity : 1.0)
                    );

                    this.mapObject.addOverlay(poly);
                }

                function $plotPolygon(polygon) {
                    var points = [];
                    for (var pi = 0; pi < polygon.points.length; pi++) {
                        var p = polygon.points[pi];
                        points.push(new GLatLng(p.lat, p.lng));
                    }

                    var poly = new GPolygon(
                        points,
                        (polygon.linecolor ? polygon.linecolor : null),
                        (polygon.lineweight !== undefined ? polygon.lineweight : null),
                        (polygon.lineopacity !== undefined ? polygon.lineopacity : 1.0),
                        (polygon.fillcolor ? polygon.fillcolor : null),
                        (polygon.fillopacity !== undefined ? polygon.fillopacity : 1.0)
                    );

                    this.mapObject.addOverlay(poly);
                }

                function $plotPushpin(pushpin) {
                    var opts = {
                        title: (pushpin.title ? pushpin.title : null),
                        icon: (pushpin.imageurl ? (function() {
                            var i = new GIcon(G_DEFAULT_ICON);
                            i.image = pushpin.imageurl;

                            i.iconAnchor = new GPoint(0, 0);
                            i.infoWindowAnchor = new GPoint(0, 0);
                            i.shadow = null;

                            var w = 0, h = 0;
                            var xo = 0, yo = 0;

                            if (pushpin.imagesize && pushpin.imagesize.w !== undefined && pushpin.imagesize.h !== undefined) {
                                w = pushpin.imagesize.w;
                                h = pushpin.imagesize.h;
                                i.iconSize = new GSize(w, h);
                            }

                            if (pushpin.G_ImageOffset) {
                                xo = pushpin.G_ImageOffset.x;
                                yo = pushpin.G_ImageOffset.y;
                            } else {
                                xo = (w > 0 ? w / 2 : 0);
                                yo = (h > 0 ? h / 2 : 0);
                            }

                            i.iconAnchor = i.infoWindowAnchor = new GPoint(xo, yo);

                            return i;
                        })() : null)
                    };

                    var marker = new GMarker(new GLatLng(pushpin.lat, pushpin.lng), opts);

                    if (pushpin.desc) {
                        GEvent.addListener(marker,
                    (pushpin.G_ShowEvent ? pushpin.G_ShowEvent : "click"),
                    function() {
                        marker.openInfoWindowHtml(pushpin.desc);
                    }
                );
                    }

                    this.mapObject.addOverlay(marker);
                }

                $map.fn.getCenter = function() {
                    var center = this.mapObject.getCenter();
                    return { lat: center.lat(), lng: center.lng() };
                };
                $map.fn.getZoom = function() {
                    return this.mapObject.getZoom();
                };

                //        $map.fn.setCenter = function(v) {
                //            this.mapObject.setCenter(new google.maps.LatLng(v.lat, v.lng));
                //            return this;
                //        };
                //        $map.fn.setZoom = function(v) {
                //            this.mapObject.setZoom(v);
                //            return this;
                //        };

                $map.fn.attachDynamicMapLoadEvents = function(options) {
                    var that = this;
                    var map = this.mapObject;

                    var overlayShown = false;

                    GEvent.addListener(map, "click", function(overlay) {
                        if (overlay) {
                            overlayShown = true;
                        }
                    });
                    GEvent.addListener(map, "moveend", function() {
                        if (overlayShown) {
                            overlayShown = false;
                        } else {
                            that.loadDynamicMapData();
                        }
                    });
                };

                $map.fn.getDynamicMapViewData = function() {
                    var bounds = this.mapObject.getBounds();
                    var l1 = bounds.getNorthEast();
                    var l2 = bounds.getSouthWest();
                    return {
                        minLat: $mvc.Utils.GetLowest(l1.lat(), l2.lat()),
                        maxLat: $mvc.Utils.GetHighest(l1.lat(), l2.lat()),
                        minLng: $mvc.Utils.GetLowest(l1.lng(), l2.lng()),
                        maxLng: $mvc.Utils.GetHighest(l1.lng(), l2.lng())
                    };
                };

                $map.fn.init.prototype = $map.fn;
            }
        })(MvcMaps);        
        
    </script>
    
    
</head>
<body>



	<div id="tabs">
		
		<ul>
			<li><a href="#tabs-1">Listing</a></li>
			<li><a href="#tabs-2">Map</a></li>
		</ul>
		
		<div id="tabs-1">

            <p>Whilst we have historically delivered less in the Utilities sector than in other sectors, the potential market is huge and opens up exciting prospects for P&T. In particular, developments in the sector such as: the UK Government mandate to roll-out approximately 50m Smart Meters by 2020; the possibility of a step change in investment in New Nuclear build, as well as the ongoing cost management issues in Electricity and Water; and the replacement of ageing assets in the water industry, all offer tremendous growth opportunities and areas of interesting work.</p>

            <p>We have set ourselves the challenge of making Utilities one of our high growth sectors and, as such, have already started to recruit senior sector experts to help us accelerate our progress. </p>
                     
		</div>
		
		<div id="tabs-2">

<%--            <div id="map_canvas" style="width:800px;height:400px;border: 1px solid black;"></div>
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
            </script> --%>

            <div id="divmap" class="GoogleMap"></div>
            <script type='text/javascript' src='http://maps.google.com/maps?file=api&v=2&key=abcdefg&sensor=false'></script> 
            <script type='text/javascript'>
                //lat: 50.853544, lng: 0.56347, zoom: 9,
                var map = null; $(function() { map = new MvcMaps.GoogleMap('divmap', { id: 'map', maptype: G_NORMAL_MAP, pushpins: [{ lat: 53.8847991960905, lng: 0.626880667525667, title: "Offered: baby bath seat", desc: "Offered: baby bath seat", imagesize: { w: 0, h: 0} }, { lat: 50.864777907861, lng: 0.549002549776071, title: "wanted Bird cage Urgent St Leonards TN37", desc: "wanted Bird cage Urgent St Leonards TN37", imagesize: { w: 0, h: 0} }, { lat: 50.8712437098622, lng: 0.587620120820766, title: "OFFERED: Various (Blacklands)", desc: "OFFERED: Various (Blacklands)", imagesize: { w: 0, h: 0} }, { lat: 50.8583356016114, lng: 0.556769100130622, title: "wanted Bird cage Urgent St Leonards TN37", desc: "wanted Bird cage Urgent St Leonards TN37", imagesize: { w: 0, h: 0} }, { lat: 50.8541227433016, lng: 0.468456007646768, title: "baby items taken STC (bexhill)", desc: "baby items taken STC (bexhill)", imagesize: { w: 0, h: 0} }, { lat: 50.8613116461283, lng: 0.580517973006805, title: "offered - internal door and toddler car seat", desc: "offered - internal door and toddler car seat", imagesize: { w: 0, h: 0} }, { lat: 50.8578478213754, lng: 0.555804445711533, title: "Wanted :- Baby monitor, Laptop batteries, working or not, St. Leonards.", desc: "Wanted :- Baby monitor, Laptop batteries, working or not, St. Leonards.", imagesize: { w: 0, h: 0} }, { lat: 50.8467550957425, lng: 0.461877749274586, title: "offered baby items (bexhill)", desc: "offered baby items (bexhill)", imagesize: { w: 0, h: 0} }, { lat: 50.8574584151286, lng: 0.579875386139181, title: "offered baby toys etc hastngs", desc: "offered baby toys etc hastngs", imagesize: { w: 0, h: 0} }, { lat: 50.8617691323627, lng: 0.547996419558028, title: "WANTED-ST Leonards-on-sea- WEB CAM", desc: "WANTED-ST Leonards-on-sea- WEB CAM", imagesize: { w: 0, h: 0} }, { lat: 50.8652265089547, lng: 0.578946118364412, title: "offered bratz new art squares", desc: "offered bratz new art squares", imagesize: { w: 0, h: 0} }, { lat: 50.847510288669, lng: 0.463504600014465, title: "Offered: cot, Bexhill", desc: "Offered: cot, Bexhill", imagesize: { w: 0, h: 0} }, { lat: 51.0292127846852, lng: 0.570559359890724, title: "TAKEN &amp; STILL ON OFFER - Various Items - Sandhurst TN18", desc: "TAKEN &amp; STILL ON OFFER - Various Items - Sandhurst TN18", imagesize: { w: 0, h: 0} }, { lat: 51.028437416839, lng: 0.569032544389903, title: "TAKEN &amp; STILL ON OFFER - Various Items - Sandhurst TN18", desc: "TAKEN &amp; STILL ON OFFER - Various Items - Sandhurst TN18", imagesize: { w: 0, h: 0} }, { lat: 50.8606293951216, lng: 0.578911518114905, title: "offered baby toy etc", desc: "offered baby toy etc", imagesize: { w: 0, h: 0}}] }); });
            </script>     

    
    
		</div>
	</div>
</body>
</html>
