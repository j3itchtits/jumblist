/*
gmap
This plugin gives you a basic google map with Google Maps API3.
http://awardwinningfjords.com/2009/07/22/google-maps-with-jquery.html
*/

jQuery.fn.gmap = function(options) {

    var defaults =
    {
        latitude: 0,
        longitude: 0,
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        title: ""
    };

    var options = $.extend(defaults, options);

    obj = $(this)[0];

    var latlng = new google.maps.LatLng(options.latitude, options.longitude);
    var myOptions = {
        zoom: options.zoom,
        center: latlng,
        mapTypeId: options.mapTypeId
    };
    var map = new google.maps.Map(obj, myOptions);
    var marker = new google.maps.Marker({ position: latlng, map: map, title: options.title });
}

