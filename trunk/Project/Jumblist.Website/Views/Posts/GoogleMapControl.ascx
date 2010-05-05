<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Pushpin>>" %>


<% 
    Ajax.GoogleMap( "map" )
    .CssClass( "GoogleMap" )
    .Load( "alert('Map Loaded!');" )
    .Center( 50.853544, 0.56347 )
    .Zoom( 9 )
    //.DynamicMap( new DynamicMapOptions() { DisplayData = "DynamicMap_DisplayData_Handler" } )
    .AddPushpin( Model )
    .Render();
    %>

<script type="text/javascript">

    function DynamicMap_DisplayData_Handler(data) {

        var bounds = new GLatLngBounds();
        var points = data.pushpins;
        
        for (p in points) {
            bounds.extend(points[p]);
        }

        this.setZoom(this.getBoundsZoomLevel(bounds));
        this.setCenter(bounds.getCenter());
        
        // Method gets called with "this" equaling the Mvc.Maps JavaScript Map Object
        
        // Clear All Currently Plotted Data
        //this.clearDynamicMapData();
        
        // Plot New Pushpins that were Loaded
        //this.plotPushpins(data.pushpins);

        // Display Pushpin Count
        //$('#lblPushpinCount').html(data.pushpins.length);
    }
    
</script>  