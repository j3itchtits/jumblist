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

        public override IQueryable<Post> SelectList()
        {
            return base.SelectList();
        }

        public virtual IQueryable<Post> SelectList( Expression<Func<Post, bool>> whereCondition )
        {
            return from x in SelectList().Where( whereCondition )
                   select x;
        }

        public virtual IEnumerable<Post> SelectListByLocation()
        {
            return from p in SelectList().AsEnumerable()
                   join pl in postLocationDataService.SelectList().AsEnumerable() on p.PostId equals pl.PostId
                   select p;
        }

        public virtual IEnumerable<Post> SelectListByLocation( Expression<Func<Post, bool>> wherePostCondition )
        {
            return from p in SelectList().Where( wherePostCondition ).AsEnumerable()
                   join pl in postLocationDataService.SelectList().AsEnumerable() on p.PostId equals pl.PostId
                   select p;
        }

        public virtual IEnumerable<Post> SelectListByLocation( Expression<Func<PostLocation, bool>> wherePostLocationCondition )
        {
            return from p in SelectList().AsEnumerable()
                   join pl in postLocationDataService.SelectList().Where( wherePostLocationCondition ).AsEnumerable() on p.PostId equals pl.PostId
                   select p;
        }

        public virtual IEnumerable<Post> SelectListByLocation( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostLocation, bool>> wherePostLocationCondition )
        {
            return from p in SelectList().Where( wherePostCondition ).AsEnumerable()
                   join pl in postLocationDataService.SelectList().Where( wherePostLocationCondition ).AsEnumerable() on p.PostId equals pl.PostId
                   select p;
        }

        public virtual IEnumerable<Post> SelectListByTag()
        {
            return from p in SelectList().AsEnumerable()
                   join pt in postTagDataService.SelectList().AsEnumerable() on p.PostId equals pt.PostId
                   select p;
        }

        public virtual IEnumerable<Post> SelectListByTag( Expression<Func<Post, bool>> wherePostCondition )
        {
            return from p in SelectList().Where( wherePostCondition ).AsEnumerable()
                   join pt in postTagDataService.SelectList().AsEnumerable() on p.PostId equals pt.PostId
                   select p;
        }

        public virtual IEnumerable<Post> SelectListByTag( Expression<Func<PostTag, bool>> wherePostTagCondition )
        {
            return from p in SelectList().AsEnumerable()
                   join pt in postTagDataService.SelectList().Where( wherePostTagCondition ).AsEnumerable() on p.PostId equals pt.PostId
                   select p;
        }

        public virtual IEnumerable<Post> SelectListByTag( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostTag, bool>> wherePostTagCondition )
        {
            return from p in SelectList().Where( wherePostCondition ).AsEnumerable()
                   join pt in postTagDataService.SelectList().Where( wherePostTagCondition ).AsEnumerable() on p.PostId equals pt.PostId
                   select p;
        }

        public virtual IEnumerable<Post> SelectListByTag( Expression<Func<Post, bool>> wherePostCondition, IQueryable<Tag> tagList )
        {
            return from p in SelectList().Where( wherePostCondition ).AsEnumerable()
                   where PostMatchesAllTags( tagList, p )
                   select p;

                   //let inner = from pt in postTagDataService.SelectList().AsEnumerable()
                   //            where pt.Tag.Name == "Baby"
                   //            select pt.PostId
                   //let inner2 = from pt in postTagDataService.SelectList().AsEnumerable()
                   //             where pt.Tag.Name == "Clothes"
                   //             select pt.PostId

                   //let inner = postTagDataService.SelectList().Where( pt => pt.Tag.Name == "Baby" ).Select( pt => pt.PostId )
                   //let inner2 = postTagDataService.SelectList().Where( pt => pt.Tag.Name == "Clothes" ).Select( pt => pt.PostId )

                   //where inner.Contains( p.PostId ) && inner2.Contains( p.PostId )
                   //where (postTagDataService.SelectList().Where( pt => pt.Tag.Name == "Baby" ).Select( pt => pt.PostId ).Contains( p.PostId )) && (postTagDataService.SelectList().Where( pt => pt.Tag.Name == "Clothes" ).Select( pt => pt.PostId ).Contains( p.PostId ))


        }

        public override Post Select( int id )
        {
            return base.Select( id );
        }

        public override void Save( Post entity )
        {
            bool newEntity = ( entity.PostId == 0 );
            bool entityImportedViaFeed = false;

            //Set Guid Property
            if ( string.IsNullOrEmpty(entity.Guid) ) entity.Guid = entity.Url;

            //Set PostCategoryId Property
            if ( entity.PostCategoryId == 0 )
            {
                entity.PostCategoryId = GetPostCategoryId( entity );
                entityImportedViaFeed = true;
            }

            //Set LastUpdatedDateTime Property
            entity.LastUpdatedDateTime = DateTime.Now;

            //Perform our validation
            ValidateBusinessRules( entity );

            //We need to save at this point in order to get the new postid for the SavePostLocations and SavePostTags in the next section (if we have a new post)
            base.Save( entity );

            //If we have a new post then we need to create some postlocations and posttags
            if ( newEntity )
            {
                //Set PostLocations and PostTags Properties and return them for use in searching for latitude and longitudes
                var locationsSaved = SavePostLocations( entity );
                var tagsSaved = SavePostTags(entity);

                //We may need to update the display to true for posts that have been imported from a feed and obey the correct logic
                bool updateDisplayToTrue = CheckIfUpdateDisplayToTrueIsNeeded(locationsSaved.Count > 0, tagsSaved.Count > 0, entity.Category.Name);

                if (entityImportedViaFeed && updateDisplayToTrue) entity.Display = true;

                //Set Latitude and Longitude Properties
                if (entity.UserId != User.Anonymous.UserId)
                {
                    entity.Latitude = entity.User.Latitude;
                    entity.Longitude = entity.User.Longitude;
                }
                else
                {
                    double[] coordinates = GetLocationCoordinates(locationsSaved);
                    entity.Latitude = coordinates[0];
                    entity.Longitude = coordinates[1];
                }

                base.Update( entity );
            }
        }

        public override void Update( Post entity )
        {
            base.Update( entity );
        }

        public override void Delete( Post entity )
        {
            base.Delete( entity );
        }

        public bool IsDuplicate( IQueryable<Post> list, string guid )
        {
            return list.Any<Post>( p => p.Guid == guid );
        }

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

        private void ValidateBusinessRules( Post entity )
        {
            IQueryable<Post> list;

            if (entity.PostId == 0)
                list = SelectList();
            else
                list = SelectList().Where( p => p.PostId != entity.PostId );

            if ( IsDuplicate( list, entity.Guid ) )
                throw new RulesException( "Post", "Duplicate Post", entity );
        }

        private List<PostLocation> SavePostLocations( Post entity )
        {
            var list = new List<PostLocation>();

            string input = (entity.Title + " " + entity.Body).Replace( "'", string.Empty ).Replace( ".", string.Empty );
            
            //string[] locations = Locations();
            //var locationList = locationDataService.SelectList();
            var locationList = locationDataService.SelectLocationsByFeed( entity.FeedId );

            foreach (Location location in locationList)
            {
                string pattern = (location.IsPostcode) ? location.NameSearch + ".*" : location.NameSearch;
                if (RegexExtensions.IsPhraseMatch(input, pattern, RegexOptions.IgnoreCase))
                {
                    var postLocationItem = new PostLocation { PostId = entity.PostId, LocationId = location.LocationId };
                    postLocationDataService.Save(postLocationItem);
                    list.Add( postLocationItem );
                }
            }
            return list;
        }

        private List<PostTag> SavePostTags(Post entity)
        {
            var list = new List<PostTag>();

            string input = entity.Title + " " + entity.Body;
            
            //string[] tags = Tags();
            var tagList = tagDataService.SelectList();

            foreach (Tag tag in tagList)
            {
                if (RegexExtensions.IsSingularOrPluralPhraseMatch(input, tag.Name, RegexOptions.IgnoreCase))
                {
                    var postTagItem = new PostTag { PostId = entity.PostId, TagId = tag.TagId };
                    postTagDataService.Save(postTagItem);
                    list.Add(postTagItem);
                }
            }
            return list;
        }

        private int GetPostCategoryId( Post entity )
        {
            string input = entity.Title;

            foreach ( PostCategory c in postCategoryDataService.SelectList() )
            {
                string pattern = "(" + c.Search.Replace( ", ", "|" ) + ")";
                //string pattern = c.Name;
                if ( Regex.IsMatch( input, pattern, RegexOptions.IgnoreCase ) )
                {
                    return c.PostCategoryId;
                }
            }
            return postCategoryDataService.Select("Unclassified").PostCategoryId;
        }

        private double[] GetLocationCoordinates(List<PostLocation> locationsSaved)
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

        private string[] Locations()
        {
            return locationDataService.SelectList()
                .Select(r => r.Name)
                .ToArray();
        }

        private string[] Tags()
        {
            return tagDataService.SelectList()
                .Select(r => r.Name)
                .ToArray();
        }

        private bool PostMatchesAllTags( IQueryable<Tag> tagList, Post post )
        {
            bool success = true;

            foreach (var tag in tagList)
            {
                success = postTagDataService.SelectList().Where( pt => pt.Tag.Name == tag.Name ).Select( pt => pt.PostId ).Contains( post.PostId );
                if (!success) break;
            }

            return success;
        }
    }
}
