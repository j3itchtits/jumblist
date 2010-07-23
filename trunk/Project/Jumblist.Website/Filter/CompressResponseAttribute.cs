﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO.Compression;

namespace Jumblist.Website.Filter
{
    public class CompressResponseAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting( ActionExecutingContext filterContext )
        {
            HttpRequestBase request = filterContext.HttpContext.Request;

            string acceptEncoding = request.Headers["Accept-Encoding"];

            if ( string.IsNullOrEmpty( acceptEncoding ) ) return;

            acceptEncoding = acceptEncoding.ToUpperInvariant();

            HttpResponseBase response = filterContext.HttpContext.Response;

            //response.Headers.Get( "Content-encoding" ).Contains( "deflate" )
            if ( acceptEncoding.Contains( "DEFLATE" ) )
            {
                response.AppendHeader( "Content-encoding", "deflate" );
                response.Filter = new DeflateStream( response.Filter, CompressionMode.Compress );
            }
            else if ( acceptEncoding.Contains( "GZIP" ) )
            {
                response.AppendHeader( "Content-encoding", "gzip" );
                response.Filter = new GZipStream( response.Filter, CompressionMode.Compress );
            }
        }

        //public override void OnActionExecuting( ActionExecutingContext filterContext )
        //{
        //    HttpRequestBase request = filterContext.HttpContext.Request;

        //    // load encodings from header
        //    QValueList encodings = new QValueList( request.Headers["Accept-Encoding"] );

        //    // get the types we can handle, can be accepted and in the defined client preference
        //    QValue preferred = encodings.FindPreferred( "gzip", "deflate", "identity" );

        //    // if none of the preferred values were found, but the
        //    // client can accept wildcard encodings, we'll default
        //    // to Gzip.
        //    if ( preferred.IsEmpty && encodings.AcceptWildcard && encodings.Find( "gzip" ).IsEmpty )

        //        preferred = new QValue( "gzip" );

        //    HttpResponseBase response = filterContext.HttpContext.Response;
        //    // handle the preferred encoding
        //    switch ( preferred.Name )
        //    {
        //        case "gzip":
        //            response.AppendHeader( "Content-encoding", "gzip" );
        //            response.Filter = new GZipStream( response.Filter, CompressionMode.Compress );
        //            break;

        //        case "deflate":
        //            response.AppendHeader( "Content-encoding", "deflate" );
        //            response.Filter = new DeflateStream( response.Filter, CompressionMode.Compress );
        //            break;

        //        case "identity":
        //            break;
        //        default:
        //            break;
        //    }
        //}
    }
}
