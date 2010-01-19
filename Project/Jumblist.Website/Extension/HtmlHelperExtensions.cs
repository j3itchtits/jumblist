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
//using Microsoft.Web.Mvc.Internal;

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

        public static string MessageBox( this HtmlHelper htmlHelper, IViewModelBase model )
        {
            HtmlTextWriter writer = new HtmlTextWriter( new StringWriter() );

            if (model.Message != null)
            {
                writer.AddAttribute( "class", model.Message.StyleClass );
                writer.RenderBeginTag( HtmlTextWriterTag.Div );
                writer.Write( model.Message.Text );
                writer.RenderEndTag();
            }

            if ((model.MessageList != null) && (model.MessageList.Count > 0))
            {
                foreach (var message in model.MessageList)
                {
                    writer.AddAttribute( "class", message.StyleClass );
                    writer.RenderBeginTag( HtmlTextWriterTag.Div );
                    writer.Write( message.Text );
                    writer.RenderEndTag();
                }    
            }

            return writer.InnerWriter.ToString();
        }

        public static string PageTitle( this HtmlHelper htmlHelper, IViewModelBase model )
        {
            if (model.PageTitle == null) return string.Empty;

            HtmlTextWriter writer = new HtmlTextWriter( new StringWriter() );

            writer.Write( model.PageTitle );

            return writer.InnerWriter.ToString();
        }

        public static string PageTitle( this HtmlHelper htmlHelper, IViewModelBase model, HtmlTextWriterTag tag )
        {
            if (model.PageTitle == null) return string.Empty;

            HtmlTextWriter writer = new HtmlTextWriter( new StringWriter() );

            writer.RenderBeginTag( tag );
            writer.Write( model.PageTitle );
            writer.RenderEndTag();

            return writer.InnerWriter.ToString();
        }

        public static string PagingLinks( this HtmlHelper helper, int currentPage, int totalPages, Func<int, string> pageUrl )
        {
            StringBuilder result = new StringBuilder();
            for (int i = 1; i <= totalPages; i++)
            {
                TagBuilder tag = new TagBuilder( "a" );
                tag.MergeAttribute( "href", pageUrl( i ).ToLower() );
                tag.InnerHtml = i.ToString();
                if (i == currentPage)
                    tag.AddCssClass( "selected" );
                result.Append( tag.ToString() + " " );
            }
            return result.ToString();
        }

        public static string NextPreviousPageLinks( this HtmlHelper helper, int currentPage, bool hasPreviousPage, bool hasNextPage, Func<int, string> pageUrl )
        {
            string result = string.Empty;

            if (hasPreviousPage)
            {
                TagBuilder tag = new TagBuilder( "a" );
                tag.MergeAttribute( "href", pageUrl( currentPage - 1 ).ToLower() );
                tag.InnerHtml = "<";
                result += tag.ToString() + " ";
            }

            if (hasNextPage)
            {
                TagBuilder tag = new TagBuilder( "a" );
                tag.MergeAttribute( "href", pageUrl( currentPage + 1 ).ToLower() );
                tag.InnerHtml = ">";
                result += tag.ToString() + " ";
            }

            return result;
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
    }
}
