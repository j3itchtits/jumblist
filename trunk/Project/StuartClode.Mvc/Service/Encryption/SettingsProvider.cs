using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Security.Cryptography;

namespace StuartClode.Mvc.Service.Encryption
{
    public class SettingsProvider : ISettingsProvider
    {
        private static readonly byte[] _encryptionKey;
        private static readonly string _encryptionPrefix;
        private static readonly string _saltGeneratorKey;

        static SettingsProvider()
        {
            //read settings from configuration 
            var useHashingString = ConfigurationManager.AppSettings["UseHashingForEncryption"];
            bool useHashing = true;
            if (string.Compare( useHashingString, "false", true ) == 0)
            {
                useHashing = false;
            }
            _encryptionPrefix = ConfigurationManager.AppSettings["EncryptionPrefix"];
            if (string.IsNullOrEmpty( _encryptionPrefix ))
            {
                _encryptionPrefix = "encryptedHidden_";
            }

            _saltGeneratorKey = ConfigurationManager.AppSettings["EncryptionSaltGeneratorKey"];
            if (string.IsNullOrEmpty( _saltGeneratorKey ))
            {
                _saltGeneratorKey = "encryptionSaltKey";
            }

            var key = ConfigurationManager.AppSettings["EncryptionKey"];

            if (useHashing)
            {
                var hash = new SHA256Managed();
                _encryptionKey = hash.ComputeHash( UTF8Encoding.UTF8.GetBytes( key ) );
                hash.Clear();
                //hash.Dispose();
            }
            else
            {
                _encryptionKey = UTF8Encoding.UTF8.GetBytes( key );
            }
        }

        #region ISettingsProvider Members

        public byte[] EncryptionKey
        {
            get { return _encryptionKey; }
        }

        public string EncryptionPrefix
        {
            get { return _encryptionPrefix; }
        }

        public string SaltGeneratorKey
        {
            get { return _saltGeneratorKey; }
        }

        #endregion
    } 
}
