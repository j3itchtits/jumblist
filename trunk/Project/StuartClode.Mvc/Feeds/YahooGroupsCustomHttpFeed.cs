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

namespace StuartClode.Mvc.Feeds
{
    public class YahooGroupsCustomHttpFeed
    {
        public static SyndicationFeed Load( string uri, string username, string password )
        {
            string feedSource = HttpReader.YahooGroup( uri, username, password );
            feedSource = Regex.Replace( feedSource, @"\<\!DOCTYPE.*?\>", String.Empty );
            feedSource = Regex.Replace( feedSource, "</html>.+", "</html>" );

            HtmlElement rootElement = HtmlElement.Create( feedSource );

            // identify the div rows
            HtmlElementFindParams findParams1 = new HtmlElementFindParams();
            findParams1.TagName = "div";
            findParams1.Attributes.Add( "class", "ygrp-contentblock" );
            findParams1.Index = 3;

            //HtmlElement divModule = rootElement.ChildElements.FindAll( findParams1 )[0];
            HtmlElement divModule = rootElement.ChildElements.Find( findParams1 );

            // identify the sub div rows
            HtmlElementFindParams findParams2 = new HtmlElementFindParams();
            findParams2.TagName = "tr";

            List<SyndicationItem> items = new List<SyndicationItem>();

            //find all the headlines
            foreach (HtmlElement tr in divModule.ChildElements.FindAll( findParams2 ))
            {
                //find the first link within the div
                HtmlAnchorElement link = (HtmlAnchorElement)tr.ChildElements.Find( "a", 0 );
                string hRef = "http://groups.yahoo.com" + link.CachedAttributes.HRef;

                items.Add( new SyndicationItem( link.CachedInnerText, link.CachedInnerText, new Uri( hRef ), hRef, DateTime.Now ) );
            }

            return new SyndicationFeed( items );
        }
    }
}
