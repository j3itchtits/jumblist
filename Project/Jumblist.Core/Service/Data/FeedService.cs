using Jumblist.Core.Model;
using System.Collections.Generic;
using System.Linq;
using StuartClode.Mvc.Service;
using StuartClode.Mvc.Repository;
using xVal.ServerSide;

namespace Jumblist.Core.Service.Data
{
    public class FeedService : DataService<Feed>, IFeedService
    {
        public FeedService( IRepository<Feed> repository )
            : base( repository )
        {
        }

        #region IFeedService Members

        public override IQueryable<Feed> SelectList()
        {
            return base.SelectList();
        }

        public override Feed Select( int id )
        {
            return base.Select( id );
        }

        public override void Save( Feed entity )
        {
            ValidateBusinessRules( entity );
            base.Save( entity );
        }

        public override void Delete( Feed entity )
        {
            base.Delete( entity );
        }

        public void ValidateBusinessRules( Feed entity )
        {
            IQueryable<Feed> list;

            if (entity.FeedId == 0)
                list = SelectList();
            else
                list = SelectList().Where( f => f.FeedId != entity.FeedId );

            if (list.Any<Feed>( f => f.Url == entity.Url ))
                throw new RulesException( "Url", "Duplicate Urls", entity );
        }

        #endregion
    }
}
