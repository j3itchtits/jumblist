using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.Text.RegularExpressions;
using StuartClode.Mvc.Helper;

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
                return Regex.IsMatch(Name, RegularExpressionString.UKPostcodeBasic, RegexOptions.IgnoreCase);
            }
        }
    }
}
