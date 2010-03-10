using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Extension;
using xVal.ServerSide;
using System.Text.RegularExpressions;
using System;
using System.Linq.Expressions;

namespace Jumblist.Core.Service.Data
{
    public class PostService : DataService<Post>, IPostService
    {
        public IDataService<PostLocation> postLocationDataService;
        public ILocationService locationDataService;
        public IDataService<PostTag> postTagDataService;
        public IDataService<Tag> tagDataService;
        public IDataService<PostCategory> postCategoryDataService;

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

        public override IQueryable<Post> SelectRecordList( Expression<Func<Post, bool>> whereCondition )
        {
            return base.SelectRecordList( whereCondition );
        }

        public IEnumerable<Post> SelectListByLocation( Expression<Func<PostLocation, bool>> wherePostLocationCondition )
        {
            return from p in SelectRecordList().AsEnumerable()
                   join pl in postLocationDataService.SelectRecordList( wherePostLocationCondition ).AsEnumerable() on p.PostId equals pl.PostId
                   select p;
        }

        public IEnumerable<Post> SelectListByLocation( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostLocation, bool>> wherePostLocationCondition )
        {
            return from p in SelectRecordList( wherePostCondition ).AsEnumerable()
                   join pl in postLocationDataService.SelectRecordList( wherePostLocationCondition ).AsEnumerable() on p.PostId equals pl.PostId
                   select p;
        }

        public IEnumerable<Post> SelectListByTag( Expression<Func<PostTag, bool>> wherePostTagCondition )
        {
            return from p in SelectRecordList().AsEnumerable()
                   join pt in postTagDataService.SelectRecordList( wherePostTagCondition ).AsEnumerable() on p.PostId equals pt.PostId
                   select p;
        }

        public IEnumerable<Post> SelectListByTag( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostTag, bool>> wherePostTagCondition )
        {
            return from p in SelectRecordList( wherePostCondition ).AsEnumerable()
                   join pt in postTagDataService.SelectRecordList( wherePostTagCondition ).AsEnumerable() on p.PostId equals pt.PostId
                   select p;
        }

        public IEnumerable<Post> SelectListByTag( Expression<Func<Post, bool>> wherePostCondition, IQueryable<Tag> tagList )
        {
            var postIds = postTagDataService.SelectRecordList( PostTag.WhereTagNameListEqualsAnd( tagList ) ).Select( pt => pt.PostId ).ToArray();

            //return from p in SelectRecordList().Where( wherePostCondition ).AsEnumerable()
            //       where TagNameListEqualsAnd( p, tagList )
            //       select p;

            //return from p in SelectRecordList().Where( wherePostCondition ).AsEnumerable()
            //       where ( postTagDataService.SelectRecordList().Where( pt => pt.Tag.Name == "Baby" ).Select( pt => pt.PostId ).Contains( p.PostId ) ) && ( postTagDataService.SelectRecordList().Where( pt => pt.Tag.Name == "Clothes" ).Select( pt => pt.PostId ).Contains( p.PostId ) )
            //       select p;

            return from p in SelectRecordList().Where( wherePostCondition.And( Post.WherePostIdListEqualsOr( postIds ) ) ).AsEnumerable()
                   select p;

            //return from p in SelectRecordList().Where( wherePostCondition.And( p => Post.WhereTagNameListEqualsAnd( tagList ) ) )
            //       select p;

//            SELECT     PostId
//FROM         PostTags
//WHERE     (PostId IN
//                          (SELECT     PostId
//                            FROM          PostTags AS PostTags_2
//                            WHERE      (TagId = 9))) AND (PostId IN
//                          (SELECT     PostId
//                            FROM          PostTags AS PostTags_1
//                            WHERE      (TagId = 43)))


            //Orders.Where(o => o.OrderDetails.Any(od => od.ProductId == 11) 
            //                && o.OrderDetails.Any(od => od.ProductId == 42))

            //new int[] { 315, 328, 401, 465, 760, 797, 874 } )

                   //let inner = from pt in postTagDataService.SelectRecordList().AsEnumerable()
                   //            where pt.Tag.Name == "Baby"
                   //            select pt.PostId
                   ////let inner2 = from pt in postTagDataService.SelectRecordList().AsEnumerable()
                   ////             where pt.Tag.Name == "Clothes"
                   ////             select pt.PostId

                   //where inner.Contains( p.PostId ) // && inner2.Contains( p.PostId )
                   //select p;


            //let inner = postTagDataService.SelectRecordList().Where( pt => pt.Tag.Name == "Baby" ).Select( pt => pt.PostId )
            //let inner2 = postTagDataService.SelectRecordList().Where( pt => pt.Tag.Name == "Clothes" ).Select( pt => pt.PostId )

                   //where inner.Contains( p.PostId ) && inner2.Contains( p.PostId )
                   //where (postTagDataService.SelectList().Where( pt => pt.Tag.Name == "Baby" ).Select( pt => pt.PostId ).Contains( p.PostId )) && (postTagDataService.SelectList().Where( pt => pt.Tag.Name == "Clothes" ).Select( pt => pt.PostId ).Contains( p.PostId ))


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
                var locationsSaved = SavePostLocations( post );
                var tagsSaved = SavePostTags(post);

                //We may need to update the display to true for posts that have been imported from a feed and obey the correct logic
                bool updateDisplayToTrue = CheckIfUpdateDisplayToTrueIsNeeded(locationsSaved.Count > 0, tagsSaved.Count > 0, post.Category.Name);

                if (entityImportedViaFeed && updateDisplayToTrue) post.Display = true;

                //Set Latitude and Longitude Properties
                if (post.UserId != User.Anonymous.UserId)
                {
                    post.Latitude = post.User.Latitude;
                    post.Longitude = post.User.Longitude;
                }
                else
                {
                    double[] coordinates = GetLocationCoordinates(locationsSaved);
                    post.Latitude = coordinates[0];
                    post.Longitude = coordinates[1];
                }

                base.Update( post );
            }
        }

        public override void Update( Post post )
        {
            base.Update( post );
        }

        public override void Delete( Post post )
        {
            base.Delete( post );
        }

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
        //           join t in tagDataService.SelectList().Where(t => t.Name.ToFriendlyUrl() == tagName).AsEnumerable() on pt.TagId equals t.TagId
        //           //where t.Name.ToFriendlyUrl() == tagName
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

        #endregion

        private bool CheckIfUpdateDisplayToTrueIsNeeded( bool locationsSaved, bool tagsSaved, string postCategory )
        {
            if (postCategory == "Offered")
                return locationsSaved && tagsSaved;
            else
                return tagsSaved;
        }

        private void ValidateBusinessRules( Post post )
        {
            var list = base.IsNew( post ) ? SelectRecordList() : SelectRecordList( Post.WhereNotEquals( post ) );

            if ( base.IsDuplicate( list, Post.WhereGuidEquals( post.Guid ) ) )
            {
                throw new RulesException( "Name", "Duplicate Post Name", post );
            }
        }

        private List<PostLocation> SavePostLocations( Post post )
        {
            var list = new List<PostLocation>();

            string input = (post.Title + " " + post.Body).Replace( "'", string.Empty ).Replace( ".", string.Empty );
            
            var locationList = locationDataService.SelectRecordListByFeed( FeedLocation.WhereFeedIdEquals( post.FeedId ) );

            foreach (Location location in locationList)
            {
                string pattern = (location.IsPostcode) ? location.NameSearch + ".*" : location.NameSearch;
                if (input.IsPhraseRegexMatch( pattern, RegexOptions.IgnoreCase ))
                {
                    var postLocationItem = new PostLocation { PostId = post.PostId, LocationId = location.LocationId };
                    postLocationDataService.Save(postLocationItem);
                    list.Add( postLocationItem );
                }
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
                string pattern = "(" + c.Search.Replace( ", ", "|" ) + ")";
                //string pattern = c.Name;
                if ( Regex.IsMatch( input, pattern, RegexOptions.IgnoreCase ) )
                {
                    return c.PostCategoryId;
                }
            }
            return postCategoryDataService.SelectRecord( x => x.Name == "Unclassified" ).PostCategoryId;
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

        private bool TagNameListEqualsAnd( Post post, IQueryable<Tag> tagList )
        {
            bool success = false;

            foreach (var tag in tagList)
            {
                success = postTagDataService.SelectRecordList( PostTag.WhereTagEquals( tag ) ).Select( pt => pt.PostId ).Contains( post.PostId );
                if (!success) break;
            }

            return success;
        }
    }
}
