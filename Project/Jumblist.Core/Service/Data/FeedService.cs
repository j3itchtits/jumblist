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

        public override IQueryable<Feed> SelectRecordList()
        {
            return base.SelectRecordList();
        }

        public override IQueryable<Feed> SelectRecordList( Expression<Func<Feed, bool>> whereCondition )
        {
            return base.SelectRecordList( whereCondition );
        }

        public override Feed SelectRecord( int id )
        {
            return base.SelectRecord( id );
        }

        public override Feed SelectRecord( Expression<Func<Feed, bool>> whereCondition )
        {
            return base.SelectRecord( whereCondition );
        }

        public Feed SelectRecord( string name )
        {
            return SelectRecord( Feed.WhereNameEquals( name ) );
        }

        public override void Save( Feed feed )
        {
            ValidateBusinessRules( feed );

            feed.FriendlyUrl = feed.Name.ToFriendlyUrl();

            base.Save( feed );
        }

        public override void Update( Feed feed )
        {
            base.Update( feed );
        }

        public override void Delete( Feed feed )
        {
            base.Delete( feed );
        }

        #endregion

        private void ValidateBusinessRules( Feed feed )
        {
            var feedList = base.IsNew( feed ) ? SelectRecordList() : SelectRecordList( Feed.WhereNotEquals( feed ) );

            if ( base.IsDuplicate( feedList, Feed.WhereUrlEquals( feed.Url ) ) )
                throw new RulesException( "Url", "Duplicate Urls", feed );

            if ( base.IsDuplicate( feedList, Feed.WhereNameEquals( feed.Name ) ) )
                throw new RulesException( "Name", "Duplicate Names", feed );
        }
    }
}
