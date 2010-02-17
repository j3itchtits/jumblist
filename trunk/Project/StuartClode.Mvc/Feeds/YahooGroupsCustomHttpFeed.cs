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
    public class YahooGroupsCustomHttpFeed// : ISyndicationFeed
    {
        public static SyndicationFeed Load( string uri, string username, string password )
        {
            string feedSource = GetFeedSource( uri, username, password );
            return ProcessFeedSource( feedSource );
        }

        public static string GetFeedSource( string uri, string username, string password )
        {
            string feedSource = HttpReader.YahooGroup( uri, username, password );
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

            int i = 0;

            foreach (HtmlElement element in elementList)
            {
                //each feed item spans two rows so we want to add the item on every odd numbered tr element
                if ((i % 2) != 0)
                {
                    HtmlElement link = element.PreviousSibling.ChildElements.Find( "a", 0 );
                    HtmlElement td = element.PreviousSibling.ChildElements.Find( "td", 1 );
                    HtmlElement pre = element.ChildElements.Find( "pre", 0 );

                    string title = GetFeedItemTitle( link );
                    string hRef = GetFeedItemLink( link );
                    DateTime publishedTime = GetFeedItemPublishedTime( td );
                    string summary = GetFeedItemSummary( pre );
                    DateTime lastUpdatedTime = GetFeedItemLastUpdatedTime();

                    var syndicationItem = new SyndicationItem( title, string.Empty, new Uri( hRef ), hRef, lastUpdatedTime );
                    syndicationItem.Summary = new TextSyndicationContent( summary, TextSyndicationContentKind.XHtml );
                    syndicationItem.PublishDate = publishedTime;

                    items.Add( syndicationItem );
                }
                
                i++;
            }

            return new SyndicationFeed( items );
        }

        private static string CleanFeedSource( string feedSource )
        {
            feedSource = Regex.Replace( feedSource, @"\<\!DOCTYPE.*?\>", String.Empty );
            feedSource = Regex.Replace( feedSource, "</html>(.|\n)*", "</html>" );
            feedSource = Regex.Replace( feedSource, "</tr>\n</tr>", "</tr>" );
            
            return feedSource;
        }

        private static HtmlElement GetRowContainer( HtmlElement rootElement )
        {
            HtmlElementFindParams findParams1 = new HtmlElementFindParams();
            findParams1.TagName = "table";
            findParams1.Attributes.Add( "class", "wide" );
            //findParams1.Index = 0;
            
            return rootElement.ChildElements.Find( findParams1 );
        }

        private static IList<HtmlElement> GetElementList( HtmlElement container )
        {
            IList<HtmlElement> elementList = container.ChildElements.ToList();
            elementList.RemoveAt( 0 );

            return elementList;
        }

        private static string GetFeedItemTitle( HtmlElement element )
        {
            return HttpUtility.HtmlDecode( element.CachedInnerText );
        }

        private static string GetFeedItemLink( HtmlElement element )
        {
            HtmlAnchorElement a = element as HtmlAnchorElement;
            return "http://groups.yahoo.com" + a.CachedAttributes.HRef;
        }

        private static DateTime GetFeedItemPublishedTime( HtmlElement element )
        {
            string dateString = Regex.Replace( element.CachedInnerText, "(.*)&gt;", String.Empty );
            return DateTime.Parse( HttpUtility.HtmlDecode( dateString ) );
        }

        private static string GetFeedItemSummary( HtmlElement element )
        {
            return HttpUtility.HtmlDecode( element.CachedInnerText );
        }

        private static DateTime GetFeedItemLastUpdatedTime()
        {
            return DateTime.Now;
        }
    }
}
