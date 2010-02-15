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
using Microsoft.Web.Testing.Light;
using System.ServiceModel.Syndication;
using System.Collections.ObjectModel;

namespace StuartClode.Mvc.Feeds
{
    public class BbcCustomHttpFeed// : ISyndicationFeed
    {
        public static SyndicationFeed Load(string uri, string username, string password)
        {
            string feedSource = HttpReader.Create( uri );
            feedSource = CleanFeedSource( feedSource );

            HtmlElement rootElement = HtmlElement.Create( feedSource );

            // identify the row container
            HtmlElement container = GetRowContainer( rootElement );

            // identify the rows and pass them into a list
            HtmlElementFindParams findParams2 = new HtmlElementFindParams();
            findParams2.TagName = "div";
            findParams2.Attributes.Add( "class", "arr" );
            ReadOnlyCollection<HtmlElement> elementList = container.ChildElements.FindAll( findParams2 );

            var items = new List<SyndicationItem>();

            //find all the headlines
            foreach (HtmlElement element in elementList)
            {
                //find the first link within the div
                HtmlAnchorElement link = (HtmlAnchorElement)element.ChildElements.Find( "a", 0 );

                var hRef = "http://news.bbc.co.uk" + link.CachedAttributes.HRef;
                items.Add( new SyndicationItem( link.CachedInnerText, link.CachedInnerText, new Uri( hRef ), hRef, DateTime.Now ) );
            }

            return new SyndicationFeed( items );
        }

        private static string CleanFeedSource( string feedSource )
        {
            feedSource = Regex.Replace( feedSource, @"\<\!DOCTYPE.*?\>", String.Empty );
            feedSource = Regex.Replace( feedSource, "</html>(.|\n)*", "</html>" );
            return feedSource;
        }

        private static HtmlElement GetRowContainer( HtmlElement rootElement )
        {
            HtmlElementFindParams findParams1 = new HtmlElementFindParams();
            findParams1.TagName = "div";
            findParams1.Attributes.Add( "class", "wgreylinebottom" );
            findParams1.Index = 0;
            return rootElement.ChildElements.Find( findParams1 );
        }
    }
}
