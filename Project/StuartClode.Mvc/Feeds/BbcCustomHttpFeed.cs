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

            feedSource = Regex.Replace( feedSource, @"\<\!DOCTYPE.*?\>", String.Empty );
            feedSource = Regex.Replace(feedSource, "</html>(.|\n)*", "</html>");

            HtmlElement rootElement = HtmlElement.Create( feedSource );

            // identify the div rows
            HtmlElementFindParams findParams1 = new HtmlElementFindParams();
            findParams1.TagName = "div";
            findParams1.Attributes.Add( "class", "wgreylinebottom" );
            findParams1.Index = 0;
            HtmlElement divParent = rootElement.ChildElements.Find( findParams1 );

            // identify the sub div rows
            HtmlElementFindParams findParams2 = new HtmlElementFindParams();
            findParams2.TagName = "div";
            findParams2.Attributes.Add( "class", "arr" );
            ReadOnlyCollection<HtmlElement> divList = divParent.ChildElements.FindAll( findParams2 );

            List<SyndicationItem> items = new List<SyndicationItem>();

            //find all the headlines
            foreach (HtmlElement div in divList)
            {
                //find the first link within the div
                HtmlAnchorElement link = (HtmlAnchorElement)div.ChildElements.Find( "a", 0 );

                var hRef = "http://news.bbc.co.uk" + link.CachedAttributes.HRef;
                items.Add( new SyndicationItem( link.CachedInnerText, link.CachedInnerText, new Uri( hRef ), hRef, DateTime.Now ) );
            }

            return new SyndicationFeed( items );
        }
    }
}
