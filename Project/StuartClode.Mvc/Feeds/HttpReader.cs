using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.IO;
using System.Text;
using System.Collections.Specialized;
using System.Collections;
using System.Text.RegularExpressions;

namespace StuartClode.Mvc.Feeds
{
    public class HttpReader
    {
        //This is a get request
        public static string Create( string uri )
        {
            var request = WebRequest.Create( uri ) as HttpWebRequest;
            request.Method = "GET";

            // Process response  
            var response = request.GetResponse() as HttpWebResponse;
            var stream = new StreamReader( response.GetResponseStream() );
            var responseString = stream.ReadToEnd();
            stream.Close();

            return responseString;
        }

        //This is post request
        public static string Create( string uri, Dictionary<string, string> postParameters )
        {
            var request = WebRequest.Create( new Uri( uri ) ) as HttpWebRequest;
            request.Method = "POST";  
            request.ContentType = "application/x-www-form-urlencoded";

            StringBuilder postData = new StringBuilder();

            foreach (KeyValuePair<string, string> val in postParameters)
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

            // Process response  
            var response = request.GetResponse() as HttpWebResponse;
            var stream = new StreamReader( response.GetResponseStream() );
            var responseString = stream.ReadToEnd();
            stream.Close();

            return responseString;

        }

        public static string GoogleAuthManagerExample( string uri, string username, string password )
        {
            AuthenticationManager.Register( new GoogleLoginClient() );
            // Now 'GoogleLogin' is a recognized authentication scheme

            GoogleCredentials creds = new GoogleCredentials( username, password, "HOSTED_OR_GOOGLE" );

            // Cached credentials can only be used when requested by specific URLs and authorization schemes
            CredentialCache credCache = new CredentialCache();
            credCache.Add( new Uri( uri ), "GoogleLogin", creds );

            WebRequest request = WebRequest.Create( uri );

            // Must be a cache, basic credentials are cleared on redirect
            request.Credentials = credCache;
            request.PreAuthenticate = true; // More efficient, but optional


            // Process response  
            var response = request.GetResponse() as HttpWebResponse;
            var stream = new StreamReader( response.GetResponseStream() );
            var responseString = stream.ReadToEnd();
            stream.Close();

            // Erase cached auth token unless you'll use it again soon.
            creds.PrevAuth = null;

            return responseString;
        }

        public static string YahooGroup( string groupUrl, string username, string password )
        {
            string authUrl = "https://login.yahoo.com/config/login?";
            string loginUrl = "https://login.yahoo.com/config/login";
            string userAgent = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.3) Gecko/20070309 Firefox/2.0.0.3";

            WebClient webClient = new WebClient();

            //begin first request (get) by setting Headers (UserAgent) and Encoding (UTF8)
            webClient.Headers[HttpRequestHeader.UserAgent] = userAgent;
            webClient.Encoding = Encoding.UTF8;

            //fetch response to get request (1)
            byte[] firstResponse = webClient.DownloadData( loginUrl );
            string firstRes = Encoding.UTF8.GetString( firstResponse );

            // begin second (post) request by setting hidden form values, then setting Headers (UserAgent,Referer and Cookie) and Encoding (UTF8)
            NameValueCollection postToLogin = new NameValueCollection();
            Regex regex = new Regex( "type=\"hidden\" name=\"(.*?)\" value=\"(.*?)\"", RegexOptions.IgnoreCase );
            Match match = regex.Match( firstRes );
            while (match.Success)
            {
                if (match.Groups[0].Value.Length > 0)
                {
                    postToLogin.Add( match.Groups[1].Value, match.Groups[2].Value );
                }
                match = regex.Match( firstRes, match.Index + match.Length );
            }

            postToLogin.Add( ".save", "Sign In" );
            postToLogin.Add( ".persistent", "y" );
            postToLogin.Add( "login", username );
            postToLogin.Add( "passwd", password );

            webClient.Headers[HttpRequestHeader.UserAgent] = userAgent;
            webClient.Headers[HttpRequestHeader.Referer] = loginUrl;
            webClient.Encoding = Encoding.UTF8;
            webClient.Headers[HttpRequestHeader.Cookie] = webClient.ResponseHeaders[HttpResponseHeader.SetCookie];

            //fetch response to post request (2)
            webClient.UploadValues( authUrl, postToLogin );
            string cookie = webClient.ResponseHeaders[HttpResponseHeader.SetCookie];

            if (string.IsNullOrEmpty( cookie ))
            {
                return "Cookie is Null or Empty";
            }

            string newCookie = string.Empty;
            string[] tmp1 = cookie.Split( ',' );
            foreach (string var in tmp1)
            {
                string[] tmp2 = var.Split( ';' );
                newCookie = String.IsNullOrEmpty( newCookie ) ? tmp2[0] : newCookie + ";" + tmp2[0];
            }

            // begin third request by setting login cookie 
            webClient.Headers[HttpRequestHeader.Cookie] = newCookie;

            //fetch response to get request (3)
            byte[] thirdResponse = webClient.DownloadData( groupUrl );
            string thirdRes = Encoding.UTF8.GetString( thirdResponse );

            return thirdRes;
        } 
    }

    public class GoogleCredentials : NetworkCredential
    {
        public Authorization PrevAuth { get; set; }
        public string AccountType { get; set; }

        public GoogleCredentials( string user, string pswd, string accountType )
            : base( user, pswd )
        {
            this.AccountType = accountType;
        }
    }

    public class GoogleLoginClient : IAuthenticationModule
    {
        internal const string authType = "GoogleLogin"; // Scheme identifier
        internal static string authServer = "https://www.google.com/accounts/ClientLogin";
        public string serviceString = "cl"; // Calendar
        //public string serviceString = "mail";
        public string source = "MSTest"; // Our program name

        private Authorization Login( WebRequest request, ICredentials credentials )
        {
            // Do we have credentials for this site?
            NetworkCredential networkCredential = credentials.GetCredential( request.RequestUri, authType );
            GoogleCredentials googleCredentials = networkCredential as GoogleCredentials;

            if (googleCredentials == null)
                return null; // none or wrong type of credentials
            if (googleCredentials.PrevAuth != null)
                return googleCredentials.PrevAuth; // Cached from last login

            ICredentialPolicy policy = AuthenticationManager.CredentialPolicy;
            if (policy != null && !policy.ShouldSendCredential( request.RequestUri, request, networkCredential, this ))
                return null;

            WebRequest client = WebRequest.Create( authServer );
            client.ContentType = "application/x-www-form-urlencoded";
            client.Method = "POST";

            // Custom authentication string:
            // Google's API says that the custom authentication string goes in the body of this request.  This is unusual.
            // http://code.google.com/apis/accounts/docs/AuthForInstalledApps.html
            String requestParams = "accountType=" + googleCredentials.AccountType + "&Email=" + googleCredentials.UserName + "&Passwd=" + googleCredentials.Password + "&service=" + serviceString + "&source=" + source;
            byte[] bytes = Encoding.UTF8.GetBytes( requestParams );
            Stream requestStream = client.GetRequestStream();
            requestStream.Write( bytes, 0, bytes.Length );
            requestStream.Close();

            // The Auth token comes in the response body. Also unusual.
            WebResponse response = client.GetResponse();
            StreamReader responseStreamReader = new StreamReader( response.GetResponseStream() );
            string result = responseStreamReader.ReadToEnd();
            responseStreamReader.Close();

            string authToken = ""; // Parse out the Auth token
            string[] tokens = result.Split( new String[] { "\n" }, StringSplitOptions.None );
            foreach (string token in tokens)
            {
                if (token.StartsWith( "Auth=", StringComparison.OrdinalIgnoreCase ))
                {
                    authToken = token;
                    break;
                }
            }

            if (authToken == "")
                throw new WebException( "GoogleLogin authentication failed" );

            // Assemble the Authorization header and cache it
            googleCredentials.PrevAuth = new Authorization( authType + " " + authToken );

            return googleCredentials.PrevAuth;
        }

        #region IAuthenticationModule Members

        public Authorization Authenticate( string challenge, WebRequest request, ICredentials credentials )
        {
            // Careful, if your challenge contains more than one
            // authorization scheme, this one might not be first
            // in the list. Also ignore parameter names and quoted
            // parameter values.  See RFC 2617 Section 1.2
            // ie: Basic, Digest nonce=122352354,
            //     realm="www.GoogleLoginDirections.com/help",
            //     GoogleLogin realm="http://login.google.com/",Ntlm
            if (!challenge.Contains( authType )
                /* && ContainsNotInQuotes(challenege,AuthType)
                 * && MoreValidation(challenege,AuthType) */
                                                            )
            {
                return null;
            }
            return Login( request, credentials );
        }

        

        public string AuthenticationType
        {
            get { return authType; }
        }

        public bool CanPreAuthenticate
        {
            get { return true; }
        }

        public Authorization PreAuthenticate( WebRequest request, ICredentials credentials )
        {
            return Login( request, credentials );
        }

        #endregion
    }
}
