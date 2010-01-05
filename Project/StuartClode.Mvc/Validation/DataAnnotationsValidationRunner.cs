using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using xVal.ServerSide;

namespace StuartClode.Mvc.Validation
{
    public static class DataAnnotationsValidationRunner
    {
        public static IEnumerable<ErrorInfo> GetErrors( object instance )
        {
            return from prop in TypeDescriptor.GetProperties( instance ).Cast<PropertyDescriptor>()
                   from attribute in prop.Attributes.OfType<ValidationAttribute>()
                   where !attribute.IsValid( prop.GetValue( instance ) )
                   select new ErrorInfo( prop.Name, attribute.FormatErrorMessage( string.Empty ), instance );
        }
    }
}
