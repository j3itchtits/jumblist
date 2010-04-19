using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace StuartClode.Mvc.Service.Encryption
{
    public class RijndaelStringEncrypter : IEncryptString
    {
        private RijndaelManaged _encryptionProvider;
        private ICryptoTransform _encrypter;
        private ICryptoTransform _decrypter;
        private byte[] _key;
        private byte[] _iv;

        public RijndaelStringEncrypter( ISettingsProvider settings, string salt )
        {
            _encryptionProvider = new RijndaelManaged();
            var saltBytes = UTF8Encoding.UTF8.GetBytes( salt );
            var derivedbytes = new Rfc2898DeriveBytes( settings.EncryptionKey, saltBytes, 3 );
            _key = derivedbytes.GetBytes( _encryptionProvider.KeySize / 8 );
            _iv = derivedbytes.GetBytes( _encryptionProvider.BlockSize / 8 );
        }

        #region IEncryptString Members

        public string Encrypt( string value )
        {
            var valueBytes = UTF8Encoding.UTF8.GetBytes( value );

            if (_encrypter == null)
            {
                _encrypter = _encryptionProvider.CreateEncryptor( _key, _iv );
            }

            var encryptedBytes = _encrypter.TransformFinalBlock( valueBytes, 0, valueBytes.Length );
            var encrypted = Convert.ToBase64String( encryptedBytes );

            return encrypted;
        }

        public string Decrypt( string value )
        {
            var valueBytes = Convert.FromBase64String( value );

            if (_decrypter == null)
            {
                _decrypter = _encryptionProvider.CreateDecryptor( _key, _iv );
            }

            var decryptedBytes = _decrypter.TransformFinalBlock( valueBytes, 0, valueBytes.Length );
            var decrypted = UTF8Encoding.UTF8.GetString( decryptedBytes );

            return decrypted;
        }

        #endregion

        #region IDisposable Members

        public void Dispose()
        {
            if (_encrypter != null)
            {
                _encrypter.Dispose();
                _encrypter = null;
            }

            if (_decrypter != null)
            {
                _decrypter.Dispose();
                _decrypter = null;
            }

            if (_encryptionProvider != null)
            {
                _encryptionProvider.Clear();
                //_encryptionProvider.Dispose();
                _encryptionProvider = null;
            }
        }

        #endregion
    } 
}
