﻿using System;
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

namespace Jumblist.Website.Module
{
    public class BbcCustomHttpFeed
    {
        public static SyndicationFeed Load( string uri )
        {
            string feedSource = HttpReader.Create( "http://news.bbc.co.uk/" );

            HtmlElement rootElement = HtmlElement.Create( Regex.Replace( feedSource, @"\<\!DOCTYPE.*?\>", String.Empty ) );

            // identify the div rows
            HtmlElementFindParams findParams1 = new HtmlElementFindParams();
            findParams1.TagName = "div";
            findParams1.Attributes.Add( "class", "wgreylinebottom" );
            findParams1.Index = 0;

            //HtmlElement divModule = rootElement.ChildElements.FindAll( findParams1 )[0];
            HtmlElement divModule = rootElement.ChildElements.Find( findParams1 );

            // identify the sub div rows
            HtmlElementFindParams findParams2 = new HtmlElementFindParams();
            findParams2.TagName = "div";
            findParams2.Attributes.Add( "class", "arr" );

            List<SyndicationItem> items = new List<SyndicationItem>();

            //find all the headlines
            foreach (HtmlElement div in divModule.ChildElements.FindAll( findParams2 ))
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
