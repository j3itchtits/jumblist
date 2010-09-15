using System;
using System.Security.Principal;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.UI;
using System.IO;
using Jumblist.Website.Controllers;
using System.Globalization;
using System.Linq.Expressions;
using System.Collections.Generic;
using Jumblist.Core.Model;
using System.Linq;
using StuartClode.Mvc.Extension;
using Jumblist.Website.ViewModel;
using System.Web.Routing;

namespace Jumblist.Website.Extension
{
    public static class HtmlHelperExtensions
    {
        public static MvcHtmlString HomepageLink( this HtmlHelper htmlHelper, string linkText )
        {
            return HomepageLink( htmlHelper, linkText, new { area = "", controller = "Home" }, null );
        }

        public static MvcHtmlString HomepageLink( this HtmlHelper htmlHelper, string linkText, object routeValues, object htmlAttributes )
        {
            return htmlHelper.ActionLink( linkText, "Index", routeValues, htmlAttributes );
        }

        public static MvcHtmlString RegisterLink( this HtmlHelper htmlHelper, string linkText )
        {
            return RegisterLink( htmlHelper, linkText, new { area = "", controller = "Users" }, null );
        }

        public static MvcHtmlString RegisterLink( this HtmlHelper htmlHelper, string linkText, string returnUrl )
        {
            return RegisterLink( htmlHelper, linkText, new { area = "", controller = "Users", returnUrl = returnUrl }, null );
        }

        public static MvcHtmlString RegisterLink( this HtmlHelper htmlHelper, string linkText, string returnUrl, object htmlAttributes )
        {
            return RegisterLink( htmlHelper, linkText, new { area = "", controller = "Users", returnUrl = returnUrl }, htmlAttributes );
        }

        public static MvcHtmlString RegisterLink( this HtmlHelper htmlHelper, string linkText, object routeValues, object htmlAttributes )
        {
            return htmlHelper.ActionLink( linkText, "register", routeValues, htmlAttributes );
        }

        public static MvcHtmlString LoginLink( this HtmlHelper htmlHelper, string linkText )
        {
            return LoginLink( htmlHelper, linkText, new { area = "", controller = "Users" }, null );
        }

        public static MvcHtmlString LoginLink( this HtmlHelper htmlHelper, string linkText, string returnUrl )
        {
            return LoginLink( htmlHelper, linkText, new { area = "", controller = "Users", returnUrl = returnUrl }, null );
        }

        public static MvcHtmlString LoginLink( this HtmlHelper htmlHelper, string linkText, object routeValues, object htmlAttributes )
        {
            return htmlHelper.ActionLink( linkText, "login", routeValues, htmlAttributes );
        }

        public static MvcHtmlString LogoutLink( this HtmlHelper htmlHelper, string linkText )
        {
            return htmlHelper.ActionLink( linkText, "Logout", new { area = "", controller = "Users" } );
        }

        public static MvcHtmlString MapImageLink( this HtmlHelper htmlHelper, string linkText, Post post )
        {
            if ( !post.HaveLatitudeAndLongitudeValuesBeenPopulated )
            {
                return MvcHtmlString.Create( string.Empty );
            }
            else
            {
                return MvcHtmlString.Create( "<a class=\"launchMapLink\" title=\"Location on map\" href=\"#\" onclick=\"setMap( " + post.Latitude + ", " + post.Longitude + ", '" + HttpUtility.HtmlEncode( post.Title ) + "');\"><img src=\"/assets/images/map-icon.png\" width=\"25\" height=\"25\" alt=\"Map\" /></a>" );
                //return MvcHtmlString.Create( "<a class=\"" + linkClass + "\" title=\"Map\" href=\"#\" onclick=\"mapPopup( " + post.Latitude + ", " + post.Longitude + ", '" + HttpUtility.HtmlEncode( post.Title ) + "');\">" + linkText + "</a>" );
            }
        }

        public static MvcHtmlString ImageLink( this HtmlHelper htmlHelper, string imgSrc, string altText, string actionName, string controllerName, object routeValues, object anchorHtmlAttributes, object imageHtmlAttributes )
        {
            //UrlHelper urlHelper = ((Controller)htmlHelper.ViewContext.Controller).Url;

            //TagBuilder imageTag = new TagBuilder( "img" );
            //imageTag.MergeAttribute( "src", imgSrc );
            //imageTag.MergeAttribute( "alt", alt );
            //imageTag.MergeAttributes( new RouteValueDictionary( imageHtmlAttributes ), true );
            //string image = imageTag.ToString( TagRenderMode.SelfClosing );

            string image = htmlHelper.Image( imgSrc, altText, imageHtmlAttributes ).ToString(); 
            

            //TagBuilder anchorTag = new TagBuilder( "a" );
            //anchorTag.MergeAttribute( "href", urlHelper.Action( actionName, controllerName, routeValues ) );
            //anchorTag.InnerHtml = image;
            //anchorTag.MergeAttributes( new RouteValueDictionary( anchorHtmlAttributes ), true );
            //string anchor = anchorTag.ToString();

            string anchor = htmlHelper.ActionLink( "[replaceme]", actionName, controllerName, routeValues, anchorHtmlAttributes ).ToString();

            return MvcHtmlString.Create( anchor.Replace( "[replaceme]", image ) );
        }

        public static MvcHtmlString EditPostLink( this HtmlHelper htmlHelper, string linkText, Post post, User user )
        {
            if ( user.UserId == User.Anonymous.UserId || post.User.UserId != user.UserId ) return MvcHtmlString.Create( string.Empty );

            return htmlHelper.ActionLink( linkText, "post", "users", new { id = post.PostId }, null );
        }        
   

        public static MvcHtmlString MessageBox( this HtmlHelper htmlHelper, IBaseViewModel model )
        {
            if ( model.Message == null ) return MvcHtmlString.Create( string.Empty );

            HtmlTextWriter writer = new HtmlTextWriter( new StringWriter() );

            writer.AddAttribute( "class", model.Message.StyleClass );
            writer.RenderBeginTag( HtmlTextWriterTag.Div );
            writer.Write( model.Message.Text );
            writer.RenderEndTag();
 
            if ( model.MessageList != null )
            {
                foreach (var message in model.MessageList)
                {
                    writer.AddAttribute( "class", message.StyleClass );
                    writer.RenderBeginTag( HtmlTextWriterTag.Div );
                    writer.Write( message.Text );
                    writer.RenderEndTag();
                }    
            }

            return MvcHtmlString.Create( writer.InnerWriter.ToString() );
        }

        public static MvcHtmlString MessageBox( this HtmlHelper htmlHelper, Message model )
        {
            if ( model == null ) return MvcHtmlString.Create( string.Empty );

            HtmlTextWriter writer = new HtmlTextWriter( new StringWriter() );

            writer.AddAttribute( "class", model.StyleClass );
            writer.RenderBeginTag( HtmlTextWriterTag.Div );
            writer.Write( model.Text );
            writer.RenderEndTag();

            return MvcHtmlString.Create( writer.InnerWriter.ToString() );
        }

        public static MvcHtmlString PageTitle( this HtmlHelper htmlHelper, IBaseViewModel model )
        {
            if ( model.PageTitle == null ) return MvcHtmlString.Create( string.Empty );

            HtmlTextWriter writer = new HtmlTextWriter( new StringWriter() );
            writer.Write( model.PageTitle );

            return  MvcHtmlString.Create( writer.InnerWriter.ToString().Trim() );
        }

        public static MvcHtmlString PageTitle( this HtmlHelper htmlHelper, IBaseViewModel model, HtmlTextWriterTag tag )
        {
            if ( model.PageTitle == null ) return MvcHtmlString.Create( string.Empty );

            HtmlTextWriter writer = new HtmlTextWriter( new StringWriter() );
            writer.RenderBeginTag( tag );
            writer.Write( model.PageTitle );
            writer.RenderEndTag();

            return MvcHtmlString.Create( writer.InnerWriter.ToString() );
        }

        public static MvcHtmlString TextBoxFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, string format, object htmlAttributes ) where TModel : class
        {
            var inputName = Microsoft.Web.Mvc.Internal.ExpressionHelper.GetInputName( expression );
            var value = GetValue( htmlHelper, expression );
            var formatted = string.Format( CultureInfo.CurrentCulture, format, value );

            return htmlHelper.TextBox( inputName, formatted, htmlAttributes );
        }

        private static TProperty GetValue<TModel, TProperty>( HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression ) where TModel : class
        {
            var model = htmlHelper.ViewData.Model;
            if ( model == null )
                return default( TProperty );

            var func = expression.Compile();
            return func( model );
        }


        public static MvcHtmlString RadioButtonList( this HtmlHelper htmlHelper, string name, IEnumerable<SelectListItem> items )
        {
            TagBuilder tableTag = new TagBuilder( "table" );
            tableTag.AddCssClass( "radio-main" );

            var trTag = new TagBuilder( "tr" );
            foreach (var item in items)
            {
                var tdTag = new TagBuilder( "td" );
                var rbValue = item.Value ?? item.Text;
                var rbName = name + "_" + rbValue;
                var radioTag = htmlHelper.RadioButton( rbName, rbValue, item.Selected, new { name = name } );

                var labelTag = new TagBuilder( "label" );
                labelTag.MergeAttribute( "for", rbName );
                labelTag.MergeAttribute( "id", rbName + "_label" );
                labelTag.InnerHtml = rbValue;

                tdTag.InnerHtml = radioTag.ToString() + labelTag.ToString();

                trTag.InnerHtml += tdTag.ToString();
            }
            tableTag.InnerHtml = trTag.ToString();

            return MvcHtmlString.Create( tableTag.ToString() );
        }

        public static MvcHtmlString RadioButtonList<T>( this HtmlHelper htmlHelper, IEnumerable<T> list, string name, string value, string text )
        {
            if (string.IsNullOrEmpty( name )) throw new ArgumentException( "name cannot be null or empty" );

            var sb = new StringBuilder();
            var enumerator = list.GetEnumerator();
            while (enumerator.MoveNext())
            {
                var obj = enumerator.Current;
                var v = obj.GetType().GetProperty( value );
                var t = obj.GetType().GetProperty( text );

                //sb.Append( InputExtensions.RadioButton( htmlHelper, name, v.GetValue( obj, null ) ) );
                sb.Append( htmlHelper.RadioButton( name, v.GetValue( obj, null ) ) );
                sb.Append( t.GetValue( obj, null ) );
            }

            return MvcHtmlString.Create( sb.ToString() );
        }

        public static MvcHtmlString LocationRadius( this HtmlHelper htmlHelper, int radius )
        {
            string locationRadius = (radius != 0) ? radius.ToString() : string.Empty;
            return MvcHtmlString.Create( locationRadius );
        }

        public static MvcHtmlString LocationName( this HtmlHelper htmlHelper, string location )
        {
            string locationName = ( !string.IsNullOrEmpty( location ) ) ? ((location).Split( new string[] { ", " }, StringSplitOptions.None ))[0] : string.Empty;
            return MvcHtmlString.Create( locationName );
        }

        public static MvcHtmlString PostTagListLinks( this HtmlHelper htmlHelper, IEnumerable<Tag> tags )
        {
            if ( tags == null ) return MvcHtmlString.Create( "No Tags" );

            var sb = new StringBuilder();

            foreach ( var tag in tags )
            {
                sb.Append( htmlHelper.ActionLink( tag.Name, "tagged", "posts", new { id = tag.FriendlyUrl }, null ) );
                sb.Append( ' ' );
            }

            return MvcHtmlString.Create( sb.ToString().Trim() );
        }

        public static MvcHtmlString PostLocationListLinks( this HtmlHelper htmlHelper, IEnumerable<Location> locations )
        {
            var sb = new StringBuilder();
            //locations.ToList().ForEach( x => htmlHelper.ActionLink( x.Name, "located", "posts", new { id = x.FriendlyUrl }, null ) );

            foreach ( var location in locations )
            {
                sb.Append( htmlHelper.ActionLink( location.Name, "located", "posts", new { id = location.FriendlyUrl }, null ) );
                sb.Append( ' ' );
            }

            return MvcHtmlString.Create( sb.ToString().Trim() );
        }

        public static MvcHtmlString PostOriginLink( this HtmlHelper htmlHelper, Post post )
        {
            if ( post.Feed != null )
            {
                return htmlHelper.ActionLink( post.Feed.Name, "group", new { id = post.Feed.Name.ToFriendlyUrlEncode() } );
            }
            else
            {
                return MvcHtmlString.Create( post.User.Name );
            }
        }

        public static MvcForm BeginUploadForm( this HtmlHelper htmlHelper )
        {
            return htmlHelper.BeginForm( null, null, FormMethod.Post, new Dictionary<string, object> { { "enctype", "multipart/form-data" } } );
        }

        public static MvcForm BeginStyledForm( this HtmlHelper htmlHelper, string cssClass )
        {
            //string formAction = htmlHelper.ViewContext.HttpContext.Request.RawUrl;
            //return FormHelper( htmlHelper, formAction, FormMethod.Post, new Dictionary<string, object> { { "class", cssClass } } );

            return htmlHelper.BeginForm( null, null, FormMethod.Post, new Dictionary<string, object> { { "class", cssClass } } );
        }
    }
}
