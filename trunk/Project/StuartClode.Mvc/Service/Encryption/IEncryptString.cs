using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StuartClode.Mvc.Service.Encryption
{
    public interface IEncryptString : IDisposable
    {
        string Encrypt( string value );
        string Decrypt( string value );
    } 
}
