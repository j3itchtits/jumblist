using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Core.Model
{
    public class SearchUser
    {
        public SearchUser() { }

        public SearchUser( string locationName, int? locationRadius, double locationLatitude, double locationLongitude )
        {
            LocationName = locationName;
            LocationRadius = locationRadius;
            LocationLatitude = locationLatitude;
            LocationLongitude = locationLongitude;
        }

        public string LocationName { get; set; }
        public int? LocationRadius { get; set; }
        public double LocationLatitude { get; set; }
        public double LocationLongitude { get; set; }
    }
}
