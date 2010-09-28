/*
gmapapi2
This plugin gives you a basic google map with Google Maps API2.
*/

jQuery.fn.gmapapi2 = function(options) {

    if (!window.GBrowserIsCompatible || !GBrowserIsCompatible()) return this;

    var defaults =
    {
        latitude: 0,
        longitude: 0,
        zoom: 14,
        mapType: G_NORMAL_MAP,
        title: ""
    };

    // Build main options before element iteration
    var opts = $.extend(defaults, options);

    var gmap = new GMap2($(this)[0]);
    var latlng = new GLatLng(opts.latitude, opts.longitude);
    
    gmap.setCenter(latlng, opts.zoom);
    gmap.setMapType(opts.mapType);
    gmap.setUIToDefault();
    gmap.addOverlay(new GMarker(latlng));

}