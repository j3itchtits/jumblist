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
        public static MvcHtmlString HomepageLink( this HtmlHelper helper, string linkText )
        {
            return HomepageLink( helper, linkText, new { area = "", controller = "Home" }, null );
        }

        public static MvcHtmlString HomepageLink( this HtmlHelper helper, string linkText, object routeValues, object htmlAttributes )
        {
            return helper.ActionLink( linkText, "Index", routeValues, htmlAttributes );
        }

        public static MvcHtmlString RegisterLink( this HtmlHelper helper, string linkText )
        {
            return RegisterLink( helper, linkText, new { area = "", controller = "Users" }, null );
        }

        public static MvcHtmlString RegisterLink( this HtmlHelper helper, string linkText, string returnUrl )
        {
            return RegisterLink( helper, linkText, new { area = "", controller = "Users", returnUrl = returnUrl }, null );
        }

        public static MvcHtmlString RegisterLink( this HtmlHelper helper, string linkText, object routeValues, object htmlAttributes )
        {
            return helper.ActionLink( linkText, "register", routeValues, htmlAttributes );
        }

        public static MvcHtmlString LoginLink( this HtmlHelper helper, string linkText )
        {
            return LoginLink( helper, linkText, new { area = "", controller = "Users" }, null );
        }

        public static MvcHtmlString LoginLink( this HtmlHelper helper, string linkText, string returnUrl )
        {
            return LoginLink( helper, linkText, new { area = "", controller = "Users", returnUrl = returnUrl }, null );
        }

        public static MvcHtmlString LoginLink( this HtmlHelper helper, string linkText, object routeValues, object htmlAttributes )
        {
            return helper.ActionLink( linkText, "login", routeValues, htmlAttributes );
        }

        public static MvcHtmlString LogoutLink( this HtmlHelper helper, string linkText )
        {
            return helper.ActionLink( linkText, "Logout", new { area = "", controller = "Users" } );
        }

        public static MvcHtmlString SavePostToBasketLink( this HtmlHelper helper, string linkText, object routeValues, object htmlAttributes )
        {
            if ( HttpContext.Current.Request.IsAuthenticated )
                return helper.ActionLink( linkText, "additem", "basket", routeValues, htmlAttributes );
            else
                return MvcHtmlString.Create( string.Empty ); 
        }

        public static MvcHtmlString MapLink( this HtmlHelper helper, string linkText, string linkClass, Post post )
        {
            if ( !post.HaveLatitudeAndLongitudeValuesBeenPopulated ) return MvcHtmlString.Create( string.Empty );

            return MvcHtmlString.Create( "<a class=\"" + linkClass + "\" title=\"Approximate location of " + HttpUtility.HtmlEncode( post.Title ) + "\" href=\"#\" onclick=\"mapPopup( " + post.Latitude + ", " + post.Longitude + ", '" + HttpUtility.HtmlEncode( post.Title ) + "');\">" + linkText + "</a>" );
        }

        public static MvcHtmlString MessageBox( this HtmlHelper helper, IBaseViewModel model )
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

        public static MvcHtmlString MessageBox( this HtmlHelper helper, Message model )
        {
            if ( model == null ) return MvcHtmlString.Create( string.Empty );

            HtmlTextWriter writer = new HtmlTextWriter( new StringWriter() );

            writer.AddAttribute( "class", model.StyleClass );
            writer.RenderBeginTag( HtmlTextWriterTag.Div );
            writer.Write( model.Text );
            writer.RenderEndTag();

            return MvcHtmlString.Create( writer.InnerWriter.ToString() );
        }

        public static MvcHtmlString PageTitle( this HtmlHelper helper, IBaseViewModel model )
        {
            if ( model.PageTitle == null ) return MvcHtmlString.Create( string.Empty );

            HtmlTextWriter writer = new HtmlTextWriter( new StringWriter() );
            writer.Write( model.PageTitle );

            return  MvcHtmlString.Create( writer.InnerWriter.ToString().Trim() );
        }

        public static MvcHtmlString PageTitle( this HtmlHelper helper, IBaseViewModel model, HtmlTextWriterTag tag )
        {
            if ( model.PageTitle == null ) return MvcHtmlString.Create( string.Empty );

            HtmlTextWriter writer = new HtmlTextWriter( new StringWriter() );
            writer.RenderBeginTag( tag );
            writer.Write( model.PageTitle );
            writer.RenderEndTag();

            return MvcHtmlString.Create( writer.InnerWriter.ToString() );
        }

        public static MvcHtmlString TextBoxFor<TModel, TProperty>( this HtmlHelper<TModel> helper, Expression<Func<TModel, TProperty>> expression, string format, object htmlAttributes ) where TModel : class
        {
            var inputName = Microsoft.Web.Mvc.Internal.ExpressionHelper.GetInputName( expression );
            var value = GetValue( helper, expression );
            var formatted = string.Format( CultureInfo.CurrentCulture, format, value );

            return helper.TextBox( inputName, formatted, htmlAttributes );
        }

        private static TProperty GetValue<TModel, TProperty>( HtmlHelper<TModel> helper, Expression<Func<TModel, TProperty>> expression ) where TModel : class
        {
            var model = helper.ViewData.Model;
            if ( model == null )
                return default( TProperty );

            var func = expression.Compile();
            return func( model );
        }


        public static MvcHtmlString RadioButtonList( this HtmlHelper helper, string name, IEnumerable<SelectListItem> items )
        {
            TagBuilder tableTag = new TagBuilder( "table" );
            tableTag.AddCssClass( "radio-main" );

            var trTag = new TagBuilder( "tr" );
            foreach (var item in items)
            {
                var tdTag = new TagBuilder( "td" );
                var rbValue = item.Value ?? item.Text;
                var rbName = name + "_" + rbValue;
                var radioTag = helper.RadioButton( rbName, rbValue, item.Selected, new { name = name } );

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

        public static MvcHtmlString RadioButtonList<T>( this HtmlHelper helper, IEnumerable<T> list, string name, string value, string text )
        {
            if (string.IsNullOrEmpty( name )) throw new ArgumentException( "name cannot be null or empty" );

            var sb = new StringBuilder();
            var enumerator = list.GetEnumerator();
            while (enumerator.MoveNext())
            {
                var obj = enumerator.Current;
                var v = obj.GetType().GetProperty( value );
                var t = obj.GetType().GetProperty( text );

                //sb.Append( InputExtensions.RadioButton( helper, name, v.GetValue( obj, null ) ) );
                sb.Append( helper.RadioButton( name, v.GetValue( obj, null ) ) );
                sb.Append( t.GetValue( obj, null ) );
            }

            return MvcHtmlString.Create( sb.ToString() );
        }

        public static MvcHtmlString LocationRadius( this HtmlHelper helper, int radius )
        {
            string locationRadius = (radius != 0) ? radius.ToString() : string.Empty;
            return MvcHtmlString.Create( locationRadius );
        }

        public static MvcHtmlString LocationName( this HtmlHelper helper, string location )
        {
            string locationName = ( !string.IsNullOrEmpty( location ) ) ? ((location).Split( new string[] { ", " }, StringSplitOptions.None ))[0] : string.Empty;
            return MvcHtmlString.Create( locationName );
        }

        public static MvcHtmlString PostTagListLinks( this HtmlHelper helper, IEnumerable<Tag> tags )
        {
            if ( tags == null ) return MvcHtmlString.Create( "No Tags" );

            var sb = new StringBuilder();

            foreach ( var tag in tags )
            {
                sb.Append( helper.ActionLink( tag.Name, "tagged", "posts", new { id = tag.FriendlyUrl }, null ) );
                sb.Append( ' ' );
            }

            return MvcHtmlString.Create( sb.ToString().Trim() );
        }

        public static MvcHtmlString PostLocationListLinks( this HtmlHelper helper, IEnumerable<Location> locations )
        {
            var sb = new StringBuilder();
            //locations.ToList().ForEach( x => helper.ActionLink( x.Name, "located", "posts", new { id = x.FriendlyUrl }, null ) );

            foreach ( var location in locations )
            {
                sb.Append( helper.ActionLink( location.Name, "located", "posts", new { id = location.FriendlyUrl }, null ) );
                sb.Append( ' ' );
            }

            return MvcHtmlString.Create( sb.ToString().Trim() );
        }

        public static MvcHtmlString PostOriginLink( this HtmlHelper helper, Post post )
        {
            if ( post.Feed != null )
            {
                return helper.ActionLink( post.Feed.Name, "group", new { id = post.Feed.Name.ToFriendlyUrlEncode() } );
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
