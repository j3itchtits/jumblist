using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.Text.RegularExpressions;
using StuartClode.Mvc.Extension;

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
                return Regex.IsMatch( Name, RegexExtensions.UKPostcodeBasic, RegexOptions.IgnoreCase );
            }
        }

        public string BingSearch
        {
            get
            {
                return ( string.IsNullOrEmpty( Area ) ) ? Name : Name + ", " + Area;
            }
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
    }
}
