using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StuartClode.Mvc.Model
{
    public class Geography
    {
        //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        //:::                                                                         :::
        //:::  This routine calculates the distance between two points (given the     :::
        //:::  latitude/longitude of those points). It is being used to calculate     :::
        //:::  the distance between two ZIP Codes or Postal Codes using our           :::
        //:::  ZIPCodeWorld(TM) and PostalCodeWorld(TM) products.                     :::
        //:::                                                                         :::
        //:::  Definitions:                                                           :::
        //:::    South latitudes are negative, east longitudes are positive           :::
        //:::                                                                         :::
        //:::  Passed to function:                                                    :::
        //:::    lat1, lon1 = Latitude and Longitude of point 1 (in decimal degrees)  :::
        //:::    lat2, lon2 = Latitude and Longitude of point 2 (in decimal degrees)  :::
        //:::    unit = the unit you desire for results                               :::
        //:::           where: 'M' is statute miles                                   :::
        //:::                  'K' is kilometers (default)                            :::
        //:::                  'N' is nautical miles                                  :::
        //:::                                                                         :::
        //:::                                                                         :::
        //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        public static double DistanceBetween( double lat1, double lon1, double lat2, double lon2, char unit )
        {
            double theta = lon1 - lon2;
            double dist = Math.Sin( Deg2Rad( lat1 ) ) * Math.Sin( Deg2Rad( lat2 ) ) + Math.Cos( Deg2Rad( lat1 ) ) * Math.Cos( Deg2Rad( lat2 ) ) * Math.Cos( Deg2Rad( theta ) );

            dist = Math.Acos( dist );
            dist = Rad2Deg( dist );
            dist = dist * 60 * 1.1515;
            
            if ( unit == 'K' )
            {
                dist = dist * 1.609344;
            }
            else if ( unit == 'N' )
            {
                dist = dist * 0.8684;
            }
            
            return ( dist );
        }

        //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        //::  This function converts decimal degrees to radians             :::
        //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        private static double Deg2Rad( double deg )
        {
            return ( deg * Math.PI / 180.0 );
        }

        //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        //::  This function converts radians to decimal degrees             :::
        //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        private static double Rad2Deg( double rad )
        {
            return ( rad / Math.PI * 180.0 );
        }
    }
}
