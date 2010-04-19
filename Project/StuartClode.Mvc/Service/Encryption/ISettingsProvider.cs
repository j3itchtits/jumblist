using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StuartClode.Mvc.Service.Encryption
{
    public interface ISettingsProvider
    {
        byte[] EncryptionKey { get; }
        string EncryptionPrefix { get; }
        string SaltGeneratorKey { get; } 
    } 
}
