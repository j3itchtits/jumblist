﻿using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Extension;
using xVal.ServerSide;
using System.Text.RegularExpressions;
using System;
using System.Linq.Expressions;
using StuartClode.Mvc.Service.Map;
using System.Data.Linq.Mapping;
using System.Reflection;
using System.Text;
using System.Net.Mail;
using System.Configuration;

namespace Jumblist.Core.Service
{
    public class PostService : DataService<Post>, IPostService
    {
        public IDataService<PostLocation> postLocationDataService;
        public ILocationService locationDataService;
        public IDataService<PostTag> postTagDataService;
        public IDataService<Tag> tagDataService;
        public IDataService<PostCategory> postCategoryDataService;
        private readonly string defaultEmail = ConfigurationManager.AppSettings["DefaultEmail"];

        public PostService(
            IRepository<Post> repository, 
            IDataService<PostLocation> postLocationDataService,
            ILocationService locationDataService,
            IDataService<PostTag> postTagDataService,
            IDataService<Tag> tagDataService,
            IDataService<PostCategory> postCategoryDataService
            )
            : base( repository )
        {
            this.postLocationDataService = postLocationDataService;
            this.locationDataService = locationDataService;
            this.postTagDataService = postTagDataService;
            this.tagDataService = tagDataService;
            this.postCategoryDataService = postCategoryDataService;
        }

        #region IPostService Members



        public override IQueryable<Post> SelectRecordList()
        {
            return base.SelectRecordList();
        }

        public override IQueryable<Post> SelectRecordList( Expression<Func<Post, bool>> wherePostCondition )
        {
            return base.SelectRecordList( wherePostCondition );
        }

        public IEnumerable<Post> SelectRecordList( Expression<Func<PostLocation, bool>> wherePostLocationCondition )
        {
            return from p in SelectRecordList().AsEnumerable()
                   join pl in postLocationDataService.SelectRecordList( wherePostLocationCondition ).AsEnumerable() on p.PostId equals pl.PostId
                   select p;
        }

        public IEnumerable<Post> SelectRecordList( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostLocation, bool>> wherePostLocationCondition )
        {
            return from p in SelectRecordList( wherePostCondition ).AsEnumerable()
                   join pl in postLocationDataService.SelectRecordList( wherePostLocationCondition ).AsEnumerable() on p.PostId equals pl.PostId
                   select p;
        }


        public IEnumerable<Post> SelectRecordList( Expression<Func<PostTag, bool>> wherePostTagCondition )
        {
            return from p in SelectRecordList().AsEnumerable()
                   join pt in postTagDataService.SelectRecordList( wherePostTagCondition ).AsEnumerable() on p.PostId equals pt.PostId
                   select p;
        }


        public IEnumerable<Post> SelectRecordList( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostTag, bool>> wherePostTagCondition )
        {
            return from p in SelectRecordList( wherePostCondition ).AsEnumerable()
                   join pt in postTagDataService.SelectRecordList( wherePostTagCondition ).AsEnumerable() on p.PostId equals pt.PostId
                   select p;
        }


        public IEnumerable<Post> SelectRecordList( string[] searchParams )
        {
            return SelectRecordList( null, searchParams, null ); ;
        }

        public IEnumerable<Post> SelectRecordList( User user )
        {
            return SelectRecordList( null, null, user ); ;
        }

        public IEnumerable<Post> SelectRecordList( string[] searchParams, User user )
        {
            return SelectRecordList( null, searchParams, user ); ;
        }

        public IEnumerable<Post> SelectRecordList( PostCategory category, string[] searchParams )
        {
            return SelectRecordList( category, searchParams, null ); ;
        }

        public IEnumerable<Post> SelectRecordList( PostCategory category, string[] searchParams, User user )
        {
            IEnumerable<Post> postList;

            if ( category != null && searchParams != null )
            {
                postList = SelectRecordList( Post.WherePostCategoryEquals( category ).And( Post.WhereSearchParamsEqualsAnd( searchParams ) ).And( Post.WhereDisplayEquals( true ) ) );
            }
            else if ( category == null && searchParams != null )
            {
                postList = SelectRecordList( Post.WhereSearchParamsEqualsAnd( searchParams ).And( Post.WhereDisplayEquals( true ) ) );
            }
            else if ( category != null && searchParams == null )
            {
                postList = SelectRecordList( Post.WherePostCategoryEquals( category ).And( Post.WhereDisplayEquals( true ) ) );
            }
            else
            {
                postList = SelectRecordList( Post.WhereDisplayEquals( true ) );
            }

            if ( !string.IsNullOrEmpty( user.Session.LocationName ) )
            {
                postList = postList.ToFilteredList( Post.WhereLocationEquals( user.Session.LocationLatitude, user.Session.LocationLongitude, user.Session.LocationRadius ) );
            }

            return postList;
        }

        public IEnumerable<Post> SelectRecordList( Feed feed, PostCategory category )
        {
            return SelectRecordList( feed, category, null );
        }

        public IEnumerable<Post> SelectRecordList( Feed feed, PostCategory category, string[] searchParams )
        {
            IEnumerable<Post> postList;

            if ( category != null && searchParams != null )
            {
                postList = SelectRecordList( Post.WhereFeedEquals( feed ).And( Post.WherePostCategoryEquals( category ) ).And( Post.WhereSearchParamsEqualsAnd( searchParams ) ).And( Post.WhereDisplayEquals( true ) ) );
            }
            else if ( category == null && searchParams != null )
            {
                postList = SelectRecordList( Post.WhereFeedEquals( feed ).And( Post.WhereSearchParamsEqualsAnd( searchParams ) ).And( Post.WhereDisplayEquals( true ) ) );
            }
            else if ( category != null && searchParams == null )
            {
                postList = SelectRecordList( Post.WhereFeedEquals( feed ).And( Post.WherePostCategoryEquals( category ) ).And( Post.WhereDisplayEquals( true ) ) );
            }
            else
            {
                postList = SelectRecordList( Post.WhereFeedEquals( feed ).And( Post.WhereDisplayEquals( true ) ) );
            }

            return postList;
        }

        public IEnumerable<Post> SelectRecordList( IEnumerable<Tag> tagList, PostCategory category, string[] q )
        {
            return SelectRecordList( tagList, category, q, null );
        }

        public IEnumerable<Post> SelectRecordList( IEnumerable<Tag> tagList, PostCategory category, string[] searchParams, User user )
        {
            IEnumerable<Post> postList;

            if ( category != null && searchParams != null )
            {
                postList = SelectRecordList( Post.WhereTagNameListEqualsAnd( tagList ).And( Post.WherePostCategoryEquals( category ) ).And( Post.WhereSearchParamsEqualsAnd( searchParams ) ).And( Post.WhereDisplayEquals( true ) ) );
            }
            else if ( category == null && searchParams != null )
            {
                postList = SelectRecordList( Post.WhereTagNameListEqualsAnd( tagList ).And( Post.WhereSearchParamsEqualsAnd( searchParams ) ).And( Post.WhereDisplayEquals( true ) ) );
            }
            else if ( category != null && searchParams == null )
            {
                postList = SelectRecordList( Post.WhereTagNameListEqualsAnd( tagList ).And( Post.WherePostCategoryEquals( category ) ).And( Post.WhereDisplayEquals( true ) ) );
            }
            else
            {
                postList = SelectRecordList( Post.WhereDisplayEquals( true ).And( Post.WhereTagNameListEqualsAnd( tagList ) ) ).OrderByDescending( t => t.PublishDateTime );
            }

            if ( !string.IsNullOrEmpty( user.Session.LocationName ) )
            {
                postList = postList.ToFilteredList( Post.WhereLocationEquals( user.Session.LocationLatitude, user.Session.LocationLongitude, user.Session.LocationRadius ) );
            }

            return postList;
        }

        public IEnumerable<Post> SelectRecordList( IEnumerable<Location> locationList, PostCategory category )
        {
            return SelectRecordList( locationList, category, null );
        }

        public IEnumerable<Post> SelectRecordList( IEnumerable<Location> locationList, PostCategory category, string[] searchParams )
        {
            IEnumerable<Post> postList;

            if ( category != null && searchParams != null )
            {
                postList = SelectRecordList( Post.WherePostCategoryEquals( category ).And( Post.WhereSearchParamsEqualsAnd( searchParams ) ).And( Post.WhereDisplayEquals( true ) ), PostLocation.WhereLocationNameListEqualsOr( locationList ) );
            }
            else if ( category == null && searchParams != null )
            {
                postList = SelectRecordList( Post.WhereSearchParamsEqualsAnd( searchParams ).And( Post.WhereDisplayEquals( true ) ), PostLocation.WhereLocationNameListEqualsOr( locationList ) );
            }
            else if ( category != null && searchParams == null )
            {
                postList = SelectRecordList( Post.WherePostCategoryEquals( category ).And( Post.WhereDisplayEquals( true ) ), PostLocation.WhereLocationNameListEqualsOr( locationList ) );
            }
            else
            {
                postList = SelectRecordList( Post.WhereDisplayEquals( true ).And( Post.WhereLocationNameListEqualsOr( locationList ) ) );
            }

            return postList;
        }

        public override Post SelectRecord( int id )
        {
            return base.SelectRecord( id );
        }

        public override Post SelectRecord( Expression<Func<Post, bool>> whereCondition )
        {
            return base.SelectRecord( whereCondition );
        }

        public override void Save( Post post )
        {
            bool newEntity = IsNew( post );
            bool entityImportedViaFeed = false;

            //Set Guid Property
            if ( string.IsNullOrEmpty(post.Guid) ) 
                post.Guid = post.Url;

            //Set PostCategoryId Property
            if ( post.PostCategoryId == 0 )
            {
                post.PostCategoryId = GetPostCategoryId( post );
                entityImportedViaFeed = true;
            }

            //Set LastUpdatedDateTime Property
            post.LastUpdatedDateTime = DateTime.Now;

            //Perform our validation
            ValidateBusinessRules( post );

            //We need to save at this point in order to get the new postid for the SavePostLocations and SavePostTags in the next section (if we have a new post)
            base.Save( post );

            //If we have a new post then we need to create some postlocations and posttags
            if ( newEntity )
            {
                //Set PostLocations and PostTags Properties and return them for use in searching for latitude and longitudes
                var locationsSaved = SavePostLocations( ref post );
                var tagsSaved = SavePostTags( post );

                //We may need to update the display to true for posts that have been imported from a feed and obey the correct logic
                bool updateDisplayToTrue = CheckIfUpdateDisplayToTrueIsNeeded( post, locationsSaved.Count > 0, tagsSaved.Count > 0, post.Category.Name );

                if (entityImportedViaFeed && updateDisplayToTrue) 
                    post.Display = true;

                //Set Latitude and Longitude Properties
                //If the post is not from an anonymous user then use their lat/long from when they registered with a postcode
                if (post.UserId != User.Anonymous.UserId)
                {
                    post.Latitude = post.User.Latitude;
                    post.Longitude = post.User.Longitude;
                }
                else
                {
                    //Latitude and longitude may have already been set if a proper postcode was found in their post (see "SavePostLocations" method)
                    if (!post.HaveLatitudeAndLongitudeValuesBeenPopulated)
                    {
                        double[] coordinates = GetLocationCoordinates( locationsSaved );
                        post.Latitude = coordinates[0];
                        post.Longitude = coordinates[1];
                    }
                }

                base.Update( post );
            }
        }

        public override void Update( Post post )
        {
            ValidateDataRules( post );
            ValidateBusinessRules( post );
            base.Update( post );
        }

        public override void Delete( Post post )
        {
            base.Delete( post );
        }

        public void Email( int postId, User user )
        {
            var post = SelectRecord( postId );

            const string mailSubject = "Jumblist post";
            //const string smtpServer = "localhost";

            StringBuilder body = new StringBuilder();
            body.AppendLine( "Here is the post you requested" );
            body.AppendLine( "---" );
            body.AppendLine( "Title:" + post.Title );
            body.AppendLine( "Group:" + post.Feed.Name );
            body.AppendLine( "Date:" + post.PublishDateTime.ToLongDateString() );
            body.AppendLine( "---" );

            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Send( new MailMessage( defaultEmail, user.Email, mailSubject, body.ToString() ) );
        }

        #endregion

        private bool CheckIfUpdateDisplayToTrueIsNeeded( Post post, bool locationsSaved, bool tagsSaved, string postCategory )
        {
            bool updateDisplayToTrue = false;

            if (postCategory == "Unclassified") return updateDisplayToTrue;

            if (postCategory == "Offered")
            {
                if (!locationsSaved)
                    locationsSaved = post.HaveLatitudeAndLongitudeValuesBeenPopulated;

                updateDisplayToTrue = locationsSaved && tagsSaved;

            }
            else
            {
                updateDisplayToTrue = tagsSaved;
            }

            return updateDisplayToTrue;
        }

        private void ValidateBusinessRules( Post post )
        {
            var list = base.IsNew( post ) ? SelectRecordList() : SelectRecordList( Post.WhereNotEquals( post ) );

            if ( base.IsDuplicate( list, Post.WhereGuidEquals( post.Guid ) ) )
            {
                throw new RulesException( "Name", "Duplicate Post Name", post );
            }
        }

        private List<PostLocation> SavePostLocations( ref Post post )
        {
            var list = new List<PostLocation>();

            string input = (post.Title + " " + post.Body).Replace( "'", string.Empty ).Replace( ".", string.Empty );
            
            //Check whether a full postcode exists in teh input - if it does we simply perform a geocode lookup and then update the post and return
            var match = Regex.Match( input, StringExtensions.UKPostcodeRegex, RegexOptions.IgnoreCase );

            if (match.Success)
            {
                var bingLocationService = new BingLocationService( match.ToString() );
                post.Latitude = bingLocationService.Latitude;
                post.Longitude = bingLocationService.Longitude;
                return list;
            }

            //Attempt to match input with locations stored in database
            var feedLocationList = locationDataService.SelectRecordListByFeed( FeedLocation.WhereFeedIdEquals( post.FeedId ) );
            var postCodeLocationList = locationDataService.SelectRecordList( Location.WhereLocationAreaIsNull() );

            foreach ( Location location in ( feedLocationList.Concat( postCodeLocationList ) ) )
            {
                string pattern = (location.IsPostcode) ? location.NameSearch + ".*" : location.NameSearch;
                if (input.IsPhraseRegexMatch( pattern, RegexOptions.IgnoreCase ))
                {
                    var postLocationItem = new PostLocation { PostId = post.PostId, LocationId = location.LocationId };
                    postLocationDataService.Save(postLocationItem);
                    list.Add( postLocationItem );
                }
            }

            //Last try is to get the Default Location for a feed/group and apply it to the post but only if the item is "offered"
            if (list.Count == 0 && post.Category.Name == "Offered")
            {
                var location = locationDataService.SelectRecord( Location.WhereFeedEquals(post.Feed) );
                var postLocationItem = new PostLocation { PostId = post.PostId, LocationId = location.LocationId };
                postLocationDataService.Save( postLocationItem );
                list.Add( postLocationItem );
            }

            return list;
        }

        private List<PostTag> SavePostTags( Post post )
        {
            var list = new List<PostTag>();

            string input = post.Title + " " + post.Body;
            
            var tagList = tagDataService.SelectRecordList();

            foreach (Tag tag in tagList)
            {
                if (input.IsSingularOrPluralPhraseRegexMatch(tag.Name, RegexOptions.IgnoreCase))
                {
                    var postTagItem = new PostTag { PostId = post.PostId, TagId = tag.TagId };
                    postTagDataService.Save(postTagItem);
                    list.Add(postTagItem);
                }
            }
            return list;
        }

        private int GetPostCategoryId( Post post )
        {
            string input = post.Title;

            foreach ( PostCategory c in postCategoryDataService.SelectRecordList() )
            {
                string pattern = "(" + c.AlternativeSearchText.Replace( ", ", "|" ) + ")";
                //string pattern = c.Name;
                if ( Regex.IsMatch( input, pattern, RegexOptions.IgnoreCase ) )
                {
                    return c.PostCategoryId;
                }
            }
            return postCategoryDataService.SelectRecord( PostCategory.WhereNameEquals( "Unclassified" ) ).PostCategoryId;
        }

        private double[] GetLocationCoordinates( List<PostLocation> locationsSaved )
        {
            double[] coordinates = new Double[2];

            if (locationsSaved.Count == 0) return coordinates;

            coordinates[0] = locationsSaved[0].Location.Latitude;
            coordinates[1] = locationsSaved[0].Location.Longitude;

            foreach (var postLocation in locationsSaved)
            {
                if (!string.IsNullOrEmpty(postLocation.Location.NamePartOfTown))
                {
                    coordinates[0] = postLocation.Location.Latitude;
                    coordinates[1] = postLocation.Location.Longitude;
                }
            }

            return coordinates;
        }

        private IEnumerable<Post> FilterListBySearchArray( IEnumerable<Post> list, string[] q )
        {
            q.ToList().ForEach( x => list = list.ToFilteredList( Post.WhereSearchTextEquals( x ) ) );
            return list;
        }

        //private string[] LocationNames()
        //{
        //    return locationDataService.SelectList()
        //        .Select(r => r.Name)
        //        .ToArray();
        //}

        //private string[] TagNames()
        //{
        //    return tagDataService.SelectList()
        //        .Select(r => r.Name)
        //        .ToArray();
        //}







        //public IEnumerable<Post> SelectRecordList( IEnumerable<Tag> tagList, IEnumerable<Location> locationList, PostCategory category, string q )
        //{
        //    IEnumerable<Post> postList;

        //    if (category != null)
        //    {
        //        postList = SelectRecordList( Post.WherePostCategoryEquals( category ).And( Post.WhereDisplayEquals( true ) ).And( Post.WhereTagNameListEqualsAnd( tagList ) ), PostLocation.WhereLocationNameListEqualsOr( locationList ) ).OrderByDescending( t => t.PublishDateTime );
        //    }
        //    else
        //    {
        //        postList = SelectRecordList( Post.WhereDisplayEquals( true ).And( Post.WhereTagNameListEqualsAnd( tagList ) ), PostLocation.WhereLocationNameListEqualsOr( locationList ) ).OrderByDescending( t => t.PublishDateTime );
        //    }

        //    if (!string.IsNullOrEmpty( q ))
        //        postList = postList.ToFilteredList( Post.WhereSearchTextEquals( q ) );

        //    return postList;
        //}

        //        public IEnumerable<Post> SelectListByTag( Expression<Func<Post, bool>> wherePostCondition, IQueryable<Tag> tagList )
        //        {
        //            //var postIds = postTagDataService.SelectRecordList( PostTag.WhereTagNameListEqualsAnd( tagList ) ).Select( pt => pt.PostId ).ToArray();

        //            //return from p in SelectRecordList().Where(wherePostCondition.And(Post.WherePostIdListEqualsOr(postIds))).AsEnumerable()
        //            //       select p;


        //            //return from p in SelectRecordList().Where( wherePostCondition ).AsEnumerable()
        //            //       where ( postTagDataService.SelectRecordList().Where( pt => pt.Tag.Name == "Baby" ).Select( pt => pt.PostId ).Contains( p.PostId ) ) && ( postTagDataService.SelectRecordList().Where( pt => pt.Tag.Name == "Clothes" ).Select( pt => pt.PostId ).Contains( p.PostId ) )
        //            //       select p;

        //            return from p in SelectRecordList().Where(wherePostCondition)
        //                   select p;

        ////            SELECT     PostId
        ////FROM         PostTags
        ////WHERE     (PostId IN
        ////                          (SELECT     PostId
        ////                            FROM          PostTags AS PostTags_2
        ////                            WHERE      (TagId = 9))) AND (PostId IN
        ////                          (SELECT     PostId
        ////                            FROM          PostTags AS PostTags_1
        ////                            WHERE      (TagId = 43)))


        //            //Orders.Where(o => o.OrderDetails.Any(od => od.ProductId == 11) 
        //            //                && o.OrderDetails.Any(od => od.ProductId == 42))

        //            //new int[] { 315, 328, 401, 465, 760, 797, 874 } )

        //                   //let inner = from pt in postTagDataService.SelectRecordList().AsEnumerable()
        //                   //            where pt.Tag.Name == "Baby"
        //                   //            select pt.PostId
        //                   ////let inner2 = from pt in postTagDataService.SelectRecordList().AsEnumerable()
        //                   ////             where pt.Tag.Name == "Clothes"
        //                   ////             select pt.PostId

        //                   //where inner.Contains( p.PostId ) // && inner2.Contains( p.PostId )
        //                   //select p;


        //            //let inner = postTagDataService.SelectRecordList().Where( pt => pt.Tag.Name == "Baby" ).Select( pt => pt.PostId )
        //            //let inner2 = postTagDataService.SelectRecordList().Where( pt => pt.Tag.Name == "Clothes" ).Select( pt => pt.PostId )

        //                   //where inner.Contains( p.PostId ) && inner2.Contains( p.PostId )
        //                   //where (postTagDataService.SelectList().Where( pt => pt.Tag.Name == "Baby" ).Select( pt => pt.PostId ).Contains( p.PostId )) && (postTagDataService.SelectList().Where( pt => pt.Tag.Name == "Clothes" ).Select( pt => pt.PostId ).Contains( p.PostId ))


        //        }


        //public override bool IsDuplicate(Expression<Func<Post, bool>> whereCondition)
        //{
        //    return base.IsDuplicate(whereCondition);
        //}

        //public IEnumerable<Post> SelectPostsByTag(int tagId)
        //{
        //    return from p in SelectList().AsEnumerable()
        //           join pt in postTagDataService.SelectList().AsEnumerable() on p.PostId equals pt.PostId
        //           where pt.TagId == tagId
        //           select p;
        //}

        //public IEnumerable<Post> SelectPostsByTag( int tagId, bool isActive )
        //{
        //    return SelectPostsByTag( tagId ).Where( x => x.Display == isActive );
        //}

        //public IEnumerable<Post> SelectPostsByTag( Tag tag, bool isActive )
        //{
        //    return SelectPostsByTag( tag.TagId ).Where( x => x.Display == isActive );
        //}

        //public IEnumerable<Post> SelectPostsByTag( Tag tag )
        //{
        //    return SelectPostsByTag( tag.TagId );
        //}

        //public IEnumerable<Post> SelectPostsByTag(IQueryable<Tag> tagList)
        //{
        //    //var predicate = PredicateBuilder.True<Tag>();

        //    //foreach (var tag in tagList)
        //    //{
        //    //    predicate = predicate.And (t => t.Name.Contains (tag.Name));
        //    //}

        //    return from p in SelectList().AsEnumerable()
        //           join pt in postTagDataService.SelectList().AsEnumerable() on p.PostId equals pt.PostId
        //           where tagList.Contains( pt.Tag )
        //           //where predicate
        //           select p;
        //}

        //public IEnumerable<Post> SelectPostsByTag(IQueryable<Tag> tagList, bool isActive)
        //{
        //    return SelectPostsByTag( tagList ).Where( x => x.Display == isActive );
        //}

        //public IEnumerable<Post> SelectPostsByTag(IQueryable<Tag> tagList, PostCategory postCategory)
        //{
        //    return SelectPostsByTag(tagList).Where(x => x.PostCategoryId == postCategory.PostCategoryId);
        //}

        //public IEnumerable<Post> SelectPostsByTag(IQueryable<Tag> tagList, PostCategory postCategory, bool isActive)
        //{
        //    return SelectPostsByTag(tagList).Where(x => x.Display == isActive && x.PostCategoryId == postCategory.PostCategoryId);
        //}

        //public IEnumerable<Post> SelectPostsByTag(string tagName)
        //{
        //    return from p in SelectList().AsEnumerable()
        //           join pt in postTagDataService.SelectList().AsEnumerable() on p.PostId equals pt.PostId
        //           join t in tagDataService.SelectList().Where(t => t.Name.FriendlyUrlEncode() == tagName).AsEnumerable() on pt.TagId equals t.TagId
        //           //where t.Name.FriendlyUrlEncode() == tagName
        //           select p;
        //}

        //public IEnumerable<Post> SelectPostsByTag( string tagName, bool isActive )
        //{
        //    return SelectPostsByTag( tagName ).Where( x => x.Display == isActive );
        //}

        //public IEnumerable<Post> SelectPostsByCategory( int categoryId )
        //{
        //    return from p in SelectList().AsEnumerable()
        //           where p.PostCategoryId == categoryId
        //           select p;
        //}

        //public IEnumerable<Post> SelectPostsByCategory( int categoryId, bool isActive )
        //{
        //    return SelectPostsByCategory( categoryId ).Where( x => x.Display == isActive );
        //}

        //public IEnumerable<Post> SelectPostsByCategory( string categoryName )
        //{
        //    return from p in SelectList().AsEnumerable()
        //           where p.Category.Name.Equals( categoryName, System.StringComparison.OrdinalIgnoreCase )
        //           select p;
        //}

        //public IEnumerable<Post> SelectPostsByCategory( string categoryName, bool isActive )
        //{
        //    return SelectPostsByCategory( categoryName ).Where( x => x.Display == isActive );
        //}



        //public IEnumerable<Post> SelectPostsByFeed( int feedId )
        //{
        //    return from p in SelectList().AsEnumerable()
        //           where p.FeedId == feedId
        //           select p;
        //}

        //public IEnumerable<Post> SelectPostsByFeed( int feedId, bool isActive )
        //{
        //    return SelectPostsByFeed( feedId ).Where( x => x.Display == isActive );
        //}

        //public IEnumerable<Post> SelectPostsByFeed( string feedName )
        //{
        //    return from p in SelectList().AsEnumerable()
        //           where p.Category.Name.Equals( feedName, System.StringComparison.OrdinalIgnoreCase )
        //           select p;
        //}

        //public IEnumerable<Post> SelectPostsByFeed( string feedName, bool isActive )
        //{
        //    return SelectPostsByFeed( feedName ).Where( x => x.Display == isActive );
        //}



    }
}