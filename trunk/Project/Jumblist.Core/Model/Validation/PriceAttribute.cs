using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using Jumblist.Core.Service;

namespace Jumblist.Core.Model.Validation
{
    public class PriceAttribute : ValidationAttribute
    {
        public double MinPrice { get; set; }

        public override bool IsValid( object value )
        {
            if (value == null)
            {
                return true;
            }
            var price = (double)value;
            if (price < MinPrice)
            {
                return false;
            }
            double cents = price - Math.Truncate( price );
            if (cents < 0.99 || cents >= 0.995)
            {
                return false;
            }

            return true;
        }
    }
}
