using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace StuartClode.Mvc.Service.Serialization
{
    public static class Serializer
    {
        public static string Serialize( object subject )
        {
            MemoryStream ms = new MemoryStream();
            BinaryFormatter bf = new BinaryFormatter();
            bf.Serialize( ms, subject );
            return Convert.ToBase64String( ms.ToArray() );
        }
        public static object Deserialize( string subject )
        {
            MemoryStream ms = new MemoryStream( Convert.FromBase64String( subject ) );
            BinaryFormatter bf = new BinaryFormatter();
            return bf.Deserialize( ms );
        }
    }
}
