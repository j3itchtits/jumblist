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
            string feedSource = HttpReader.YahooGroup( uri, username, password );
            feedSource = CleanFeedSource( feedSource );

            HtmlElement rootElement = HtmlElement.Create( feedSource );

            // identify the row container
            HtmlElement container = GetRowContainer( rootElement );

            // identify the rows and pass them into a list
            IList<HtmlElement> elementList = container.ChildElements.ToList();
            elementList.RemoveAt( 0 );

            var items = new List<SyndicationItem>();

            int i = 0;

            foreach (HtmlElement element in elementList)
            {
                //each feed item spans two rows so we want to add the item on every odd numbered tr element
                if ((i % 2) != 0)
                {
                    HtmlAnchorElement link = (HtmlAnchorElement)element.PreviousSibling.ChildElements.Find( "a", 0 );
                    string title = link.CachedInnerText;
                    string hRef = "http://groups.yahoo.com" + link.CachedAttributes.HRef;

                    HtmlElement td = element.PreviousSibling.ChildElements.Find( "td", 1 );
                    string dateString = Regex.Replace( td.CachedInnerText, "(.*)&gt;", String.Empty );
                    DateTime datePublished = DateTime.Parse( HttpUtility.HtmlDecode( dateString ) );

                    HtmlElement pre = element.ChildElements.Find( "pre", 0 );
                    string summary = pre.CachedInnerText;

                    var syndicationItem = new SyndicationItem( title, string.Empty, new Uri( hRef ), hRef, DateTime.Now );
                    syndicationItem.Summary = new TextSyndicationContent( summary, TextSyndicationContentKind.XHtml );
                    syndicationItem.PublishDate = datePublished;

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
    }
}
