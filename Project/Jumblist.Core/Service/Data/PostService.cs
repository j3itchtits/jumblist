using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service;
using StuartClode.Mvc.Repository;
using xVal.ServerSide;

namespace Jumblist.Core.Service.Data
{
    public class PostService : DataService<Post>, IPostService
    {
        public IRepository<PostLocation> postLocations;
        public IRepository<Location> locations;

        public PostService(IRepository<Post> repository, IRepository<PostLocation> postLocations, IRepository<Location> locations)
            : base( repository )
        {
            this.postLocations = postLocations;
            this.locations = locations;
        }

        #region IPostService Members

        public override IQueryable<Post> SelectList()
        {
            return base.SelectList();
        }

        public virtual IQueryable<Post> SelectPostsByLocation(int locationId)
        {
            return from p in SelectList()
                   join pl in postLocations.SelectList() on p.PostId equals pl.PostId
                   where pl.LocationId == locationId
                   select p;
        }

        public virtual IQueryable<Post> SelectPostsByLocation(string locationName)
        {
            return from p in SelectList()
                   join pl in postLocations.SelectList() on p.PostId equals pl.PostId
                   join l in locations.SelectList() on pl.LocationId equals l.LocationId
                   where l.Name == locationName
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
