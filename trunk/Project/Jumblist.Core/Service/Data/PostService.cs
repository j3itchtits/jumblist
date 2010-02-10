using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Extension;
using xVal.ServerSide;
using System.Text.RegularExpressions;

namespace Jumblist.Core.Service.Data
{
    public class PostService : DataService<Post>, IPostService
    {
        public IDataService<PostLocation> postLocationDataService;
        public IDataService<Location> locationDataService;
        public IDataService<PostTag> postTagDataService;
        public IDataService<Tag> tagDataService;
        public IDataService<PostCategory> postCategoryDataService;

        public PostService(
            IRepository<Post> repository, 
            IDataService<PostLocation> postLocationDataService,
            IDataService<Location> locationDataService,
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

        public virtual IQueryable<Post> SelectList( bool IsActive )
        {
            return SelectList().Where( x => x.Display == IsActive );
        }

        public override Post Select( int id )
        {
            return base.Select( id );
        }

        public override void Save( Post entity )
        {
            bool newEntity = ( entity.PostId == 0 );

            if (string.IsNullOrEmpty(entity.Guid))
                entity.Guid = entity.Url;

            if ( entity.PostCategoryId == 0 )
                entity.PostCategoryId = GetPostCategoryId( entity );

            ValidateBusinessRules( entity );

            // we need to save at this point in order to get the new postid for the next section
            base.Save( entity );

            if (newEntity)
            {
                bool locations = SavePostLocations( entity );
                bool tags = SavePostTags( entity );

                if ( locations && tags && ( entity.Display == false ) )
                {
                    entity.Display = true;
                    base.Save( entity );
                }
            }
        }

        public override void Delete( Post entity )
        {
            base.Delete( entity );
        }

        public IEnumerable<Post> SelectPostsByLocation(int locationId)
        {
            return from p in SelectList().AsEnumerable()
                   join pl in postLocationDataService.SelectList().AsEnumerable() on p.PostId equals pl.PostId
                   where pl.LocationId == locationId
                   select p;
        }

        public IEnumerable<Post> SelectPostsByLocation( int locationId, bool isActive )
        {
            return SelectPostsByLocation( locationId ).Where( x => x.Display == isActive );
        }

        public IEnumerable<Post> SelectPostsByLocation(string locationName)
        {
            return from p in SelectList().AsEnumerable()
                   join pl in postLocationDataService.SelectList().AsEnumerable() on p.PostId equals pl.PostId
                   join l in locationDataService.SelectList().AsEnumerable() on pl.LocationId equals l.LocationId
                   where l.Name.ToFriendlyUrl() == locationName
                   select p;
        }

        public IEnumerable<Post> SelectPostsByLocation( string locationName, bool isActive )
        {
            return SelectPostsByLocation( locationName ).Where( x => x.Display == isActive );
        }

        public IEnumerable<Post> SelectPostsByTag(int tagId)
        {
            return from p in SelectList().AsEnumerable()
                   join pt in postTagDataService.SelectList().AsEnumerable() on p.PostId equals pt.PostId
                   where pt.TagId == tagId
                   select p;
        }

        public IEnumerable<Post> SelectPostsByTag( int tagId, bool isActive )
        {
            return SelectPostsByTag( tagId ).Where( x => x.Display == isActive );
        }

        public IEnumerable<Post> SelectPostsByTag(string tagName)
        {
            return from p in SelectList().AsEnumerable()
                   join pt in postTagDataService.SelectList().AsEnumerable() on p.PostId equals pt.PostId
                   join t in tagDataService.SelectList().AsEnumerable() on pt.TagId equals t.TagId
                   where t.Name.ToFriendlyUrl() == tagName
                   select p;
        }

        public IEnumerable<Post> SelectPostsByTag( string tagName, bool isActive )
        {
            return SelectPostsByTag( tagName ).Where( x => x.Display == isActive );
        }

        public IEnumerable<Post> SelectPostsByCategory( int categoryId )
        {
            return from p in SelectList().AsEnumerable()
                   where p.PostCategoryId == categoryId
                   select p;
        }

        public IEnumerable<Post> SelectPostsByCategory( int categoryId, bool isActive )
        {
            return SelectPostsByCategory( categoryId ).Where( x => x.Display == isActive );
        }

        public IEnumerable<Post> SelectPostsByCategory( string categoryName )
        {
            return from p in SelectList().AsEnumerable()
                   where p.Category.Name.Equals( categoryName, System.StringComparison.OrdinalIgnoreCase )
                   select p;
        }

        public IEnumerable<Post> SelectPostsByCategory( string categoryName, bool isActive )
        {
            return SelectPostsByCategory( categoryName ).Where( x => x.Display == isActive );
        }

        public bool IsDuplicate( IQueryable<Post> list, string guid )
        {
            return list.Any<Post>( p => p.Guid == guid );
        }

        public IEnumerable<Post> SelectPostsByFeed( int feedId )
        {
            return from p in SelectList().AsEnumerable()
                   where p.FeedId == feedId
                   select p;
        }

        public IEnumerable<Post> SelectPostsByFeed( int feedId, bool isActive )
        {
            return SelectPostsByFeed( feedId ).Where( x => x.Display == isActive );
        }

        public IEnumerable<Post> SelectPostsByFeed( string feedName )
        {
            return from p in SelectList().AsEnumerable()
                   where p.Category.Name.Equals( feedName, System.StringComparison.OrdinalIgnoreCase )
                   select p;
        }

        public IEnumerable<Post> SelectPostsByFeed( string feedName, bool isActive )
        {
            return SelectPostsByFeed( feedName ).Where( x => x.Display == isActive );
        }

        #endregion

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

        private bool SavePostLocations(Post entity)
        {
            bool success = false;
            string search = entity.Title + " " + entity.Body;

            foreach (string l in Locations())
            {
                if (Regex.IsMatch(search, l, RegexOptions.IgnoreCase))
                {
                    var locationItem = locationDataService.Select(l);
                    var postLocationItem = new PostLocation { PostId = entity.PostId, LocationId = locationItem.LocationId };
                    postLocationDataService.Save(postLocationItem);
                    success = true;
                }
            }
            return success;
        }

        private bool SavePostTags( Post entity )
        {
            bool success = false;
            string search = entity.Title + " " + entity.Body;

            foreach (string t in Tags())
            {
                if (Regex.IsMatch(search, t, RegexOptions.IgnoreCase))
                {
                    var tagItem = tagDataService.Select(t);
                    var postTagItem = new PostTag { PostId = entity.PostId, TagId = tagItem.TagId };
                    postTagDataService.Save(postTagItem);
                    success = true;
                }
            }
            return success;
        }

        private int GetPostCategoryId( Post entity )
        {
            string search = entity.Title;

            foreach ( PostCategory c in postCategoryDataService.SelectList() )
            {
                if ( Regex.IsMatch( search, c.Name, RegexOptions.IgnoreCase ) )
                {
                    return c.PostCategoryId;
                }
            }
            return 0;
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
    }
}
