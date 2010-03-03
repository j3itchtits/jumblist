using Jumblist.Core.Model;
using System.Collections.Generic;
using System.Linq;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Repository;
using xVal.ServerSide;
using StuartClode.Mvc.Extension;
using System.Linq.Expressions;
using System;

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

        public override IQueryable<Feed> SelectList(Expression<Func<Feed, bool>> whereCondition)
        {
            return base.SelectList(whereCondition);
        }

        public override Feed Select( int id )
        {
            return base.Select( id );
        }

        public override void Save( Feed entity )
        {
            ValidateBusinessRules( entity );

            entity.FriendlyUrl = entity.Name.ToFriendlyUrl();

            base.Save( entity );
        }

        public override void Update(Feed entity)
        {
            base.Update(entity);
        }

        public override void Delete( Feed entity )
        {
            base.Delete( entity );
        }

        #endregion

        private void ValidateBusinessRules( Feed entity )
        {
            IQueryable<Feed> list;

            if (entity.FeedId == 0)
            {
                list = SelectList();
            }
            else
            {
                list = SelectList().Where(f => f.FeedId != entity.FeedId);
            }

            if (base.IsDuplicate(Feed.Duplicate(entity.Url)))
            {
                throw new RulesException("Url", "Duplicate Urls", entity);
            }
        }
    }
}
