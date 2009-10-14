using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Collections.Specialized;
using System.Text;
using System.IO;

namespace Jumblist.Website.Helpers
{
    public class HttpRequestResponse
    {
        private string _uri = string.Empty;
        private string _userName = string.Empty;
        private string _password = string.Empty;
        private string _proxyServer = string.Empty;
        private int _proxyPort = 0;
        private string _postData = string.Empty;

        public HttpRequestResponse( string uri )
        {
            _uri = uri;
        }

        public string UserName
        {
            get{ return _userName; }
            set{ _userName = value; }
        }

        public string Password
        {
            get{ return _password; }
            set{ _password = value; }
        }

        public string ProxyServer
        {
            get{ return _proxyServer; }
            set{ _proxyServer = value; }
        }

        public int ProxyPort
        {
            get{ return _proxyPort; }
            set{ _proxyPort = value; }
        }

        public string PostData
        {
            get { return _postData; }
            set { _postData = value; }
        }

        //This public interface receives the request 
        //and send the response of type string.
        public string SendRequest()
        {
            string finalResponse = string.Empty;
            string cookie = string.Empty;

            try
            {
                HttpWebRequest webrequest = CreateWebRequest( _uri, new NameValueCollection(), "GET", true );
                HttpWebResponse webresponse = (HttpWebResponse)webrequest.GetResponse();

                string redirectUri = GetRedirectURL( webresponse, ref cookie );
                //Check if there is any redirected URI.

                webresponse.Close();
                redirectUri = redirectUri.Trim();
                if (redirectUri.Length == 0) //No redirection URI to redirect Uri is assigned the original uri
                {
                    redirectUri = _uri;
                }

                finalResponse = GetFinalResponse( redirectUri, cookie, "POST", true );

            }
            catch (WebException e)
            {
                throw CatchHttpExceptions( e.Message );
            }
            //catch (Exception e)
            //{
            //    throw new Exception( e.Message );
            //}

            return finalResponse;
        }



        //HELPER METHODS

        /// <summary>
        /// This method creates secure/non secure web
        /// request based on the parameters passed.
        /// </summary>
        /// <param name="uri">the url to return</param>
        /// <param name="headerElements">This parameter of type
        ///    NameValueCollection may contain any extra header
        ///    elements to be included in this request      </param>
        /// <param name="RequestMethod">Value can POST OR GET</param>
        /// <param name="NwCred">In case of secure request this would be true</param>
        /// <returns></returns>

        public HttpWebRequest CreateWebRequest( string uri, NameValueCollection requestHeaderElements, string httpRequestMethod, bool nwCred )
        {
            HttpWebRequest webrequest = (HttpWebRequest)WebRequest.Create( uri );
            webrequest.KeepAlive = false;
            webrequest.Method = httpRequestMethod;

            int iCount = requestHeaderElements.Count;
            string key;
            string keyvalue;

            for (int i = 0; i < iCount; i++)
            {
                key = requestHeaderElements.Keys[i];
                keyvalue = requestHeaderElements[i];
                webrequest.Headers.Add( key, keyvalue );
            }

            webrequest.ContentType = "text/html";
            //"application/x-www-form-urlencoded";

            if (!string.IsNullOrEmpty(ProxyServer))
                webrequest.Proxy = new WebProxy( ProxyServer, ProxyPort );

            webrequest.AllowAutoRedirect = false;

            if (nwCred)
            {
                CredentialCache wrCache = new CredentialCache();
                wrCache.Add( new Uri( uri ), "Digest", new NetworkCredential( UserName, Password ) );
                webrequest.Credentials = wrCache;
            }

            //Remove collection elements
            requestHeaderElements.Clear();

            return webrequest;
        }

        /// <summary>
        /// This method retreives redirected URL from
        /// response header and also passes back
        /// any cookie (if there is any)
        /// </summary>
        /// <param name="webresponse"></param>
        /// <param name="Cookie"></param>
        /// <returns></returns>

        public string GetRedirectURL( HttpWebResponse webresponse, ref string cookie )
        {
            string uri = "";

            WebHeaderCollection headers = webresponse.Headers;

            if ((webresponse.StatusCode == HttpStatusCode.Found) || (webresponse.StatusCode == HttpStatusCode.Redirect) || (webresponse.StatusCode == HttpStatusCode.Moved) || (webresponse.StatusCode == HttpStatusCode.MovedPermanently))
            {
                // Get redirected uri
                uri = headers["Location"];
                uri = uri.Trim();
            }

            //Check for any cookies
            if (headers["Set-Cookie"] != null)
            {
                cookie = headers["Set-Cookie"];
            }

            //                string StartURI = "http:/";
            //                if (uri.Length > 0 && uri.StartsWith(StartURI)==false)
            //                {
            //                      uri = StartURI + uri;
            //                }

            return uri;
        }

        /// <summary>
        /// This method fetches the response based on the original request.
        /// </summary>
        /// <param name="ReUri"></param>
        /// <param name="Cookie"></param>
        /// <param name="RequestMethod">Value can POST OR GET</param>
        /// <param name="NwCred">In case of secure request this would be true</param>
        /// <returns></returns>
        /// 
        public string GetFinalResponse( string redirectUri, string cookie, string httpRequestMethod, bool nwCred )
        {
            NameValueCollection requestHeaderElements = new NameValueCollection();

            if (cookie.Length > 0)
            {
                requestHeaderElements.Add( "Cookie", cookie );
            }

            HttpWebRequest webrequest = CreateWebRequest( redirectUri, requestHeaderElements, httpRequestMethod, nwCred );

            BuildReqStream( ref webrequest );

            HttpWebResponse webresponse = (HttpWebResponse)webrequest.GetResponse();

            Encoding enc = System.Text.Encoding.GetEncoding( 1252 );
            StreamReader loResponseStream = new StreamReader( webresponse.GetResponseStream(), enc );

            string response = loResponseStream.ReadToEnd();

            loResponseStream.Close();
            webresponse.Close();

            return response;
        }

        private void BuildReqStream( ref HttpWebRequest webrequest )
        //This method build the request stream for WebRequest
        {
            byte[] bytes = Encoding.ASCII.GetBytes( PostData );
            webrequest.ContentLength = bytes.Length;

            Stream oStreamOut = webrequest.GetRequestStream();
            oStreamOut.Write( bytes, 0, bytes.Length );
            oStreamOut.Close();
        }

        private WebException CatchHttpExceptions( string ErrMsg )
        {
            ErrMsg = "Error During Web Interface. Error is: " + ErrMsg;
            return new WebException( ErrMsg );
        }
    }

}
