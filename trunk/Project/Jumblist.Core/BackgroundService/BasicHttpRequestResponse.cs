using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.IO;
using System.Text;
using System.Collections.Specialized;
using System.Collections;

namespace Jumblist.Website.BackgroundService
{
    public class BasicHttpRequestResponse
    {
        private string _url; 
        private string _userName;
        private string _password;
        private Dictionary<string, string> _postParameters;

        public BasicHttpRequestResponse( string url )
        {
            _url = url;
        }

        public string UserName
        {
            get { return _userName; }
            set { _userName = value; }
        }

        public string Password
        {
            get { return _password; }
            set { _password = value; }
        }

        public Dictionary<string, string> PostParameters
        {
            get { return _postParameters; }
            set { _postParameters = value; }
        }

        public string SendGetRequest()
        {
            string responseString;
            string eTag = "arse";
            string ifModifiedSince = "arse";
            string responseDate = string.Empty;

            NetworkCredential creds = new NetworkCredential( UserName, Password );
            CredentialCache credCache = new CredentialCache();
            // Cached credentials can only be used when requested by
            // specific URLs and authorization schemes
            credCache.Add( new Uri( _url ), "Basic", creds );


            var request = WebRequest.Create( _url ) as HttpWebRequest;

            //request.Timeout = 1000;
            //request.Headers[HttpRequestHeader.IfNoneMatch] = eTag;
            //request.IfModifiedSince = DateTime.Now.AddHours( -1 );
            request.Credentials = credCache;
            request.PreAuthenticate = true;

            //request.AllowAutoRedirect = true;
            

            try
            {
                var response = request.GetResponse();
                var stream = new StreamReader( response.GetResponseStream() );
                responseString = stream.ReadToEnd();
                stream.Close();

                // store the ETag and last modified date of
                // the file to be used in the http conditional get
                //eTag = response.Headers[HttpResponseHeader.ETag];
                //ifModifiedSince = response.Headers[HttpResponseHeader.LastModified];
            }
            catch (WebException ex)
            {
                responseString = ex.Status + " - " + ex.Message;
            }

            return 
                "eTag : " + eTag + Environment.NewLine +
                "ifModifiedSince : " + ifModifiedSince + Environment.NewLine +
                "Response : " + Environment.NewLine + responseString;
        }

        public string SendPostRequest()
        {
            string responseString;

            var address = new Uri( _url );

            var request = WebRequest.Create( address ) as HttpWebRequest;
            request.Method = "POST";  
            request.ContentType = "application/x-www-form-urlencoded";

            StringBuilder postData = new StringBuilder();

            foreach (KeyValuePair<string, string> val in PostParameters)
            {
                postData.Append( val.Key.ToString() + "=" + HttpUtility.UrlEncode( val.Value.ToString() ) );
            }

            // Create a byte array of the data we want to send  
            byte[] byteData = UTF8Encoding.UTF8.GetBytes( postData.ToString() );

            // Set the content length in the request headers  
            request.ContentLength = byteData.Length;

            // Write data  
            using (Stream postStream = request.GetRequestStream())  
            {  
                postStream.Write(byteData, 0, byteData.Length);  
            } 

            // Get response  
            try
            {
                var response = request.GetResponse();
                var stream = new StreamReader( response.GetResponseStream() );
                responseString = stream.ReadToEnd();
                stream.Close();
            }
            catch (WebException ex)
            {
                responseString = ex.Status + " - " + ex.Message;
            }

            return responseString;

        }

    }
}
