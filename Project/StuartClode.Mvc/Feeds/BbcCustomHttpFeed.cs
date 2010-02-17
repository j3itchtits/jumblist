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
        public static SyndicationFeed Load( string uri, string username, string password )
        {
            string feedSource = GetFeedSource( uri, username, password );
            return ProcessFeedSource( feedSource );
        }

        public static string GetFeedSource( string uri, string username, string password )
        {
            string feedSource = HttpReader.Create( uri );
            return CleanFeedSource( feedSource );
        }

        public static SyndicationFeed ProcessFeedSource( string feedSource )
        {
            HtmlElement rootElement = HtmlElement.Create( feedSource );

            // identify the row container
            HtmlElement container = GetRowContainer( rootElement );

            // identify the rows and pass them into a list
            IList<HtmlElement> elementList = GetElementList( container );

            var items = new List<SyndicationItem>();

            //find all the headlines
            foreach (HtmlElement element in elementList)
            {
                //find the first link within the div
                HtmlAnchorElement link = (HtmlAnchorElement)element.ChildElements.Find( "a", 0 );

                string title = GetFeedItemTitle( link );
                string hRef = GetFeedItemLink( link );
                DateTime publishedTime = GetFeedItemPublishedTime();
                string summary = GetFeedItemSummary();
                DateTime lastUpdatedTime = GetFeedItemLastUpdatedTime();

                var syndicationItem = new SyndicationItem( title, string.Empty, new Uri( hRef ), hRef, lastUpdatedTime );
                syndicationItem.Summary = new TextSyndicationContent( summary, TextSyndicationContentKind.XHtml );
                syndicationItem.PublishDate = publishedTime;

                items.Add( syndicationItem );


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

        private static IList<HtmlElement> GetElementList( HtmlElement container )
        {
            HtmlElementFindParams findParams2 = new HtmlElementFindParams();
            findParams2.TagName = "div";
            findParams2.Attributes.Add( "class", "arr" );

            IList<HtmlElement> elementList = container.ChildElements.FindAll( findParams2 ).ToList();

            return elementList;
        }

        private static string GetFeedItemTitle( HtmlElement element )
        {
            return HttpUtility.HtmlDecode( element.CachedInnerText );
        }

        private static string GetFeedItemLink( HtmlElement element )
        {
            HtmlAnchorElement a = element as HtmlAnchorElement;
            return "http://news.bbc.co.uk" + a.CachedAttributes.HRef;
        }

        private static DateTime GetFeedItemPublishedTime()
        {
            return DateTime.Now;
        }

        private static string GetFeedItemSummary()
        {
            return string.Empty;
        }

        private static DateTime GetFeedItemLastUpdatedTime()
        {
            return DateTime.Now;
        }
    }
}
