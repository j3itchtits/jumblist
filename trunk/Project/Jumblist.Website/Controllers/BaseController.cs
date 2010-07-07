using System.Web.Mvc;
using Jumblist.Website.Filter;
using Jumblist.Core.Model;
using System.Collections.Generic;

namespace Jumblist.Website.Controllers
{
    //[CustomAuthentication]
    //[HandleError( ExceptionType = typeof( PrimaryKeyNotFoundException ), View = "NotFound" )]
    //[HandleError( ExceptionType = typeof( ResourceNotFoundException ), View = "NotFound" )]
    //[HandleError]

    //[ElmahHandleError]
    //[CompressResponse]
    [CopyTempDataToViewData]
    public abstract class BaseController : Controller
    {
        public virtual string PageTitle
        {
            get { return TempData["pagetitle"] as string; }
            set { TempData["pagetitle"] = value; }
        }

        public virtual string SimpleMessage
        {
            get { return TempData["simplemessage"] as string; }
            set { TempData["simplemessage"] = value; }
        }

        public virtual Message Message
        {
            get { return TempData["message"] as Message; }
            set { TempData["message"] = value; }
        }

        public virtual List<Message> MessageList
        {
            get { return TempData["messagelist"] as List<Message>; }
            set { TempData["messagelist"] = value; }
        }

        public virtual string ReturnUrl
        {
            get { return TempData["returnurl"] as string; }
            set { TempData["returnurl"] = value; }
        }







        //[NonAction]
        //protected internal virtual IEnumerable<SelectListItem> BuildSelectList( IEnumerable<string> ienum )
        //{
        //    IEnumerable<SelectListItem> items = ienum.Select( x => new SelectListItem() { Text = x, Value = x.ToLower() } );
        //    return items;

        //    //List<SelectListItem> selectList = new List<SelectListItem>();

        //    //foreach ( var p in array )
        //    //{
        //    //    selectList.Add( new SelectListItem() { Text = p, Value = p.ToLower() } );
        //    //}

        //    //return selectList;
        //}

        //[NonAction]
        //protected internal virtual IEnumerable SelectList( IEnumerable<string> ienum )
        //{
        //    IEnumerable items = ienum.Select( x => new { Text = x, Value = x.ToLower() } );
        //    return items;
        //}

        //[NonAction]
        //protected internal virtual IEnumerable<SelectListItem> BuildSelectList( IDictionary<string, string> idic )
        //{
        //    IEnumerable<SelectListItem> items = idic.Select( x => new SelectListItem() { Text = x.Key, Value = x.Value.ToLower() } );
        //    return items;
        //}

        //[NonAction]
        //protected internal virtual IEnumerable SelectList( IDictionary<string, string> idic )
        //{
        //    IEnumerable items = idic.Select( x => new { Text = x.Key, Value = x.Value.ToLower() } );
        //    return items;
        //}

        //[NonAction]
        //protected internal IEnumerable PostCategoryAddPostSelectList()
        //{
        //    return new[] 
        //    { 
        //        new { Text = PostCategoryId.Offered.ToString(), Value = ((int)PostCategoryId.Offered).ToString() }, 
        //        new { Text = PostCategoryId.Wanted.ToString(), Value = ((int)PostCategoryId.Wanted).ToString() } 
        //    };
        //}

        //[NonAction]
        //protected internal IEnumerable PostCategorySearchSelectList()
        //{
        //    return new[] 
        //    { 
        //        new { Text = "All", Value = "" }, 
        //        new { Text = PostCategoryId.Offered.ToString(), Value = PostCategoryId.Offered.ToString().ToLower() }, 
        //        new { Text = PostCategoryId.Wanted.ToString(), Value = PostCategoryId.Wanted.ToString().ToLower() } 
        //    };
        //}
    }
}