using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Core.Model
{
    public class UserSession
    {
        public UserSession() 
        {
            Basket = new Basket();
        }

        public UserSession( int? pageSize )
        {
            PageSize = pageSize;
            Basket = new Basket();
        }

        public UserSession( string locationName, int locationRadius, double locationLatitude, double locationLongitude )
        {
            LocationName = locationName;
            LocationRadius = locationRadius;
            LocationLatitude = locationLatitude;
            LocationLongitude = locationLongitude;
            Basket = new Basket();
        }

        public string LocationName { get; set; }
        public int LocationRadius { get; set; }
        public double LocationLatitude { get; set; }
        public double LocationLongitude { get; set; }
        public int? PageSize { get; set; }
        public Basket Basket { get; set; }
    }
}
