using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service.Data
{
    public interface ILocationService
    {
        IQueryable<Location> SelectRecordList();
        IQueryable<Location> SelectRecordList( Expression<Func<Location, bool>> whereCondition );
        Location SelectRecord( int id );
        Location SelectRecord( Expression<Func<Location, bool>> whereCondition );
        void Save( Location entity );
        void Update( Location entity );
        void Delete( Location entity );
        string[] SelectLocationNameTownList();
        string[] SelectLocationAreaList( string q );
        string[] SelectLocationNameAndAreaList( string q );
        IEnumerable<Location> SelectRecordListByFeed( Expression<Func<FeedLocation, bool>> whereCondition );
    }
}