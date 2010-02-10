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

            feedSource = Regex.Replace( feedSource, @"\<\!DOCTYPE.*?\>", String.Empty );
            feedSource = Regex.Replace( feedSource, "</html>(.|\n)*", "</html>" );
            feedSource = Regex.Replace( feedSource, "</tr>\n</tr>", "</tr>" );

            HtmlElement rootElement = HtmlElement.Create( feedSource );

            // identify the table of content
            HtmlElementFindParams findParams1 = new HtmlElementFindParams();
            findParams1.TagName = "table";
            findParams1.Attributes.Add( "class", "wide" );
            //findParams1.Index = 0;
            HtmlElement table = rootElement.ChildElements.Find( findParams1 );

            // identify the tr rows within table
            //HtmlElementFindParams findParams2 = new HtmlElementFindParams();
            //findParams2.TagName = "tr";
            //findParams2.Attributes.Add( "class", "" );

            //ReadOnlyCollection<HtmlElement> trList = table.ChildElements.FindAll( findParams2 );
            IList<HtmlElement> trList = table.ChildElements.ToList();
            trList.RemoveAt( 0 );

            IList<SyndicationItem> items = new List<SyndicationItem>();

            int i = 0;

            foreach (HtmlElement tr in trList)
            {
                //each feed item spans two rows so we want to add the item on every odd numbered tr element
                if ((i % 2) != 0)
                {
                    HtmlAnchorElement link = (HtmlAnchorElement)tr.PreviousSibling.ChildElements.Find( "a", 0 );
                    string title = link.CachedInnerText;
                    string hRef = "http://groups.yahoo.com" + link.CachedAttributes.HRef;

                    HtmlElement td = tr.PreviousSibling.ChildElements.Find( "td", 1 );
                    string dateString = Regex.Replace( td.CachedInnerText, "(.*)&gt;", String.Empty );
                    DateTime datePublished = DateTime.Parse( HttpUtility.HtmlDecode( dateString ) );

                    HtmlElement pre = tr.ChildElements.Find( "pre", 0 );
                    string summary = pre.CachedInnerText;

                    var syndicationItem = new SyndicationItem( title, string.Empty, new Uri( hRef ), hRef, DateTime.Now );
                    syndicationItem.Summary = new TextSyndicationContent( summary );
                    syndicationItem.PublishDate = datePublished;

                    items.Add( syndicationItem );
                }
                
                i++;
            }

            return new SyndicationFeed( items );
        }
    }
}
