using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace Jumblist.Model.Entity
{
    public class BasketUser : IDataErrorInfo
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string PostCode { get; set; }

        public string this[string columnName]
        {
            get
            {
                if ((columnName == "Name") &&(string.IsNullOrEmpty(Name)))
                    return "Please enter a name";
                if ((columnName == "Email") && (string.IsNullOrEmpty( Email )))
                    return "Please enter a valid email address";
                if ((columnName == "PostCode") && (string.IsNullOrEmpty( PostCode )))
                    return "Please enter a valid postcode";
                return null;
            }
        }

        #region IDataErrorInfo Members

        public string Error
        {
            get { return null; }
        }

        #endregion
    }
}
