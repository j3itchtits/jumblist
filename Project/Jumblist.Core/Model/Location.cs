using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.Text.RegularExpressions;
using StuartClode.Mvc.Extension;
using System.Linq.Expressions;

namespace Jumblist.Core.Model
{
    public partial class Location
    {
        public IList<Post> Posts
        {
            get { return postLocations.Select( p => p.Post ).ToList().AsReadOnly(); }
        }

        public bool IsPostcode
        {
            get 
            {
                return Regex.IsMatch( Name, StringExtensions.UKPostcodeBasic, RegexOptions.IgnoreCase );
            }
        }

        public string BingSearch
        {
            get
            {
                return ( string.IsNullOrEmpty( Area ) ) ? Name : Name + ", " + Area;
            }
        }

        public string FullLocationName
        {
            get;
            set;
        }

        public string NamePartOfTown
        {
            get
            {
                string[] locationArray = Name.Split( new string[] { ", " }, StringSplitOptions.None );
                return (locationArray.Length > 1) ? locationArray[0] : string.Empty;
            }
        }

        public string NameTown
        {
            get
            {
                string[] locationArray = Name.Split( new string[] { ", " }, StringSplitOptions.None );
                return (locationArray.Length > 1) ? locationArray[1] : locationArray[0];
            }
        }

        public string NameSearch
        {
            get
            {
                string[] locationArray = Name.Split( new string[] { ", " }, StringSplitOptions.None );
                return locationArray[0];
            }
        }

        public string AreaCounty
        {
            get
            {
                string[] locationArray = Area.Split( new string[] { ", " }, StringSplitOptions.None );
                return (locationArray.Length > 1) ? locationArray[0] : string.Empty;
            }
        }

        public string AreaCountry
        {
            get
            {
                string[] locationArray = Area.Split( new string[] { ", " }, StringSplitOptions.None );
                return (locationArray.Length > 1) ? locationArray[1] : locationArray[0];
            }
        }

        public static Expression<Func<Location, bool>> WhereEquals( string name, string area )
        {
            return x => ( x.Name == name && x.Area == area );
        }

        public static Expression<Func<Location, bool>> WhereEquals( Location location )
        {
            return x => x.LocationId == location.LocationId;
        }

        public static Expression<Func<Location, bool>> WhereNotEquals( Location location )
        {
            return x => x.LocationId != location.LocationId;
        }

        public static Expression<Func<Location, bool>> WhereFriendlyUrlEquals( string friendlyUrl )
        {
            return x => x.FriendlyUrl == friendlyUrl;
        }

        public static Expression<Func<Location, bool>> WhereFriendlyUrlListEqualsOr(string[] locationList)
        {
            return x => locationList.Contains(x.FriendlyUrl);
        }
    }
}
