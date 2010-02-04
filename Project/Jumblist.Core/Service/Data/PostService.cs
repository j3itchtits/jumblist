using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Extension;
using xVal.ServerSide;

namespace Jumblist.Core.Service.Data
{
    public class PostService : DataService<Post>, IPostService
    {
        public IRepository<PostLocation> postLocations;
        public IRepository<Location> locations;
        public IRepository<PostTag> postTags;
        public IRepository<Tag> tags;

        public PostService( IRepository<Post> repository, IRepository<PostLocation> postLocations, IRepository<Location> locations, IRepository<PostTag> postTags, IRepository<Tag> tags )
            : base( repository )
        {
            this.postLocations = postLocations;
            this.locations = locations;
            this.postTags = postTags;
            this.tags = tags;
        }

        #region IPostService Members

        public override IQueryable<Post> SelectList()
        {
            return base.SelectList();
        }

        public IEnumerable<Post> SelectPostsByLocation( int locationId )
        {
            return from p in SelectList().AsEnumerable()
                   join pl in postLocations.SelectList().AsEnumerable() on p.PostId equals pl.PostId
                   where pl.LocationId == locationId
                   select p;
        }

        public IEnumerable<Post> SelectPostsByLocation( string locationName )
        {
            return from p in SelectList().AsEnumerable()
                   join pl in postLocations.SelectList().AsEnumerable() on p.PostId equals pl.PostId
                   join l in locations.SelectList().AsEnumerable() on pl.LocationId equals l.LocationId
                   where l.Name.ToFriendlyUrl() == locationName
                   select p;
        }

        public IEnumerable<Post> SelectPostsByTag( int tagId )
        {
            return from p in SelectList().AsEnumerable()
                   join pt in postTags.SelectList().AsEnumerable() on p.PostId equals pt.PostId
                   where pt.TagId == tagId
                   select p;
        }

        public IEnumerable<Post> SelectPostsByTag( string tagName )
        {
            return from p in SelectList().AsEnumerable()
                   join pt in postTags.SelectList().AsEnumerable() on p.PostId equals pt.PostId
                   join t in tags.SelectList().AsEnumerable() on pt.TagId equals t.TagId
                   where t.Name.ToFriendlyUrl() == tagName
                   select p;
        }

        public override Post Select( int id )
        {
            return base.Select( id );
        }

        public override void Save( Post entity )
        {
            ValidateBusinessRules( entity );
            base.Save( entity );
        }

        public override void Delete( Post entity )
        {
            base.Delete( entity );
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

        public bool IsDuplicate( IQueryable<Post> list, string id )
        {
            return list.Any<Post>( p => p.Guid == id );
        }
    }
}
