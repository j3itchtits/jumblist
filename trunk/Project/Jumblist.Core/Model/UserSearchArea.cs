using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Core.Model
{
    [Serializable]
    public class UserSearchArea
    {
        public string LocationName { get; set; }
        public int Radius { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }

        public void Update( string locationName, int locationRadius, double locationLatitude, double locationLongitude )
        {
            this.LocationName = locationName;
            this.Radius = locationRadius;
            this.Latitude = locationLatitude;
            this.Longitude = locationLongitude;
        }

        public void Reset()
        {
            Update( string.Empty, 0, 0, 0 );
        }
    }
}
