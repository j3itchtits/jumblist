using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using StuartClode.Mvc.GeocodeService;

namespace StuartClode.Mvc.Service.Bing
{
    public class BingLocationService
    {
        public BingLocationService() { }

        public BingLocationService( string address )
        {
            GeocodeAddress( address );
        }

        public double Latitude { get; private set; }
        public double Longitude { get; private set; }

        public string GeocodeAddress( string address )
        {
            try
            {
                string results = "";
                string key = "AplxUm9o3hkw6qCXBbp61H7HYlDrz-qz8ldgKLJ8Udjd8MFNJAfxxy2IWrfd4bw8";
                GeocodeRequest geocodeRequest = new GeocodeRequest();

                // Set the credentials using a valid Bing Maps key
                geocodeRequest.Credentials = new GeocodeService.Credentials();
                geocodeRequest.Credentials.ApplicationId = key;

                // Set the full address query
                geocodeRequest.Query = address;

                // Set the options to only return high confidence results 
                ConfidenceFilter[] filters = new ConfidenceFilter[1];
                filters[0] = new ConfidenceFilter();
                filters[0].MinimumConfidence = GeocodeService.Confidence.Medium;

                // Add the filters to the options
                GeocodeOptions geocodeOptions = new GeocodeOptions();
                geocodeOptions.Filters = filters;
                geocodeRequest.Options = geocodeOptions;

                // Make the geocode request
                GeocodeServiceClient geocodeService = new GeocodeServiceClient("BasicHttpBinding_IGeocodeService");
                GeocodeResponse geocodeResponse = geocodeService.Geocode(geocodeRequest);

                if (geocodeResponse.Results.Length > 0)
                {
                    Latitude = geocodeResponse.Results[0].Locations[0].Latitude;
                    Longitude = geocodeResponse.Results[0].Locations[0].Longitude;
                    results = String.Format("Latitude: {0}\nLongitude: {1}", Latitude, Longitude);
                }
                else
                {
                    results = "No Results Found";
                }

                return results;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            
        }

        public string ReverseGeocodePoint( string locationString )
        {
            try
            {
                string results = "";
                string key = "AplxUm9o3hkw6qCXBbp61H7HYlDrz-qz8ldgKLJ8Udjd8MFNJAfxxy2IWrfd4bw8";
                ReverseGeocodeRequest reverseGeocodeRequest = new ReverseGeocodeRequest();

                // Set the credentials using a valid Bing Maps key
                reverseGeocodeRequest.Credentials = new GeocodeService.Credentials();
                reverseGeocodeRequest.Credentials.ApplicationId = key;

                // Set the point to use to find a matching address
                GeocodeService.Location point = new GeocodeService.Location();
                string[] digits = locationString.Split(',');

                point.Latitude = double.Parse(digits[0].Trim());
                point.Longitude = double.Parse(digits[1].Trim());

                reverseGeocodeRequest.Location = point;

                // Make the reverse geocode request
                GeocodeServiceClient geocodeService = new GeocodeServiceClient("BasicHttpBinding_IGeocodeService");
                GeocodeResponse geocodeResponse = geocodeService.ReverseGeocode(reverseGeocodeRequest);

                if (geocodeResponse.Results.Length > 0)
                    results = geocodeResponse.Results[0].DisplayName;
                else
                    results = "No Results found";

                return results;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
    }
}
