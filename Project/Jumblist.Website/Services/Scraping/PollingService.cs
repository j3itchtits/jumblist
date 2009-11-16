using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using System.Data;

namespace Jumblist.Website.Services.Scraping
{
    public class PollingService : IHttpModule
    {
        protected static Timer _timer;
        protected static object _semaphore;
        protected static string _value;

        static PollingService()
        {
            _semaphore = new object();
        }

        protected void DoWork( object state )
        {
            lock (_semaphore)
            {
                var results = new DataSet();
                results.ReadXml( @"http://weather.yahooapis.com/forecastrss?p=UKXX0929", XmlReadMode.Auto );
                var description = (results.Tables["condition"].Rows[0]["text"]).ToString();
                var temperature = (results.Tables["condition"].Rows[0]["temp"]).ToString();
                var unit = (results.Tables["units"].Rows[0]["temperature"]).ToString();
                _value = String.Format( "{0} {1} degrees {2}", description, temperature, unit );
            }
        }

        protected void OnBeginRequest( object sender, EventArgs e )
        {
            lock (_semaphore)
            {
                HttpContext.Current.Items["Temp"] = _value;
            }
        }


        #region IHttpModule Members

        public void Dispose()
        {
            
        }

        public void Init( HttpApplication application )
        {
            application.BeginRequest += OnBeginRequest;

            //There must only ever be 1 instance of Timer class
            if (_timer == null)
            {
                var timerCallback = new TimerCallback( DoWork );
                var startTime = 0;
                var tickDuration = 30000;
                _timer = new Timer( timerCallback, null, startTime, tickDuration );
            }
        }

        #endregion
    }
}
