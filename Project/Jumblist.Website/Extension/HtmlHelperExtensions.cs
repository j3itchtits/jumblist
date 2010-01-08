using System;
using System.Security.Principal;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Microsoft.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.UI;
using System.IO;
using Jumblist.Website.Controllers;
using Microsoft.Web.Mvc.Internal;
using System.Globalization;
using System.Linq.Expressions;
using System.Collections.Generic;

namespace Jumblist.Website.Extension
{
    public static class HtmlHelperExtensions
    {
        public static string HomepageLink( this HtmlHelper helper, string linkText )
        {
            return HomepageLink( helper, linkText, null );
        }

        public static string HomepageLink( this HtmlHelper helper, string linkText, object htmlAttributes )
        {
            return helper.ActionLink<HomeController>( p => p.Index(), linkText, htmlAttributes );
        }

        public static string RegisterLink( this HtmlHelper helper, string linkText )
        {
            return RegisterLink( helper, linkText, string.Empty, null );
        }

        public static string RegisterLink( this HtmlHelper helper, string linkText, string returnUrl )
        {
            return RegisterLink( helper, linkText, returnUrl, null );
        }

        public static string RegisterLink( this HtmlHelper helper, string linkText, string returnUrl, object htmlAttributes )
        {
            return helper.ActionLink( linkText, "register", "users", new { returnurl = returnUrl }, htmlAttributes );
        }

        public static string LoginLink( this HtmlHelper helper, string linkText )
        {
            return LoginLink( helper, linkText, string.Empty, null );
        }

        public static string LoginLink( this HtmlHelper helper, string linkText, string returnUrl )
        {
            return LoginLink( helper, linkText, returnUrl, null );
        }

        public static string LoginLink( this HtmlHelper helper, string linkText, string returnUrl, object htmlAttributes )
        {
            return helper.ActionLink( linkText, "login", "users", new { returnurl = returnUrl }, htmlAttributes );
        }

        public static string LogoutLink( this HtmlHelper helper, string linkText )
        {
            return helper.ActionLink<UsersController>( c => c.Logout(), linkText );
        }

        public static string MessageBox( this HtmlHelper htmlHelper, IViewModelBase model )
        {
            if (model.NotificationMessage == null) return string.Empty;

            HtmlTextWriter writer = new HtmlTextWriter( new StringWriter() );

            writer.AddAttribute( "class", model.NotificationMessage.StyleClass );
            writer.RenderBeginTag( HtmlTextWriterTag.Div );
            writer.Write( model.NotificationMessage.Text );
            writer.RenderEndTag();

            return writer.InnerWriter.ToString();
        }

        public static string MessageBoxAlt( this HtmlHelper htmlHelper, IViewModelBase model )
        {
            if (!model.Notification.IsValid() ) return string.Empty;

            HtmlTextWriter writer = new HtmlTextWriter( new StringWriter() );

            foreach ( var message in model.Notification.AllMessages() )
            {
                writer.AddAttribute( "class", message.StyleClass );
                writer.RenderBeginTag( HtmlTextWriterTag.Div );
                writer.Write( message.Text );
                writer.RenderEndTag();
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

        public static string TextBoxFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, string format, object htmlAttributes ) where TModel : class
        {
            var inputName = ExpressionHelper.GetInputName( expression );
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
