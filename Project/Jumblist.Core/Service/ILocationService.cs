﻿using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service
{
    public interface ILocationService
    {
        IQueryable<Location> SelectRecordList();
        IQueryable<Location> SelectRecordList( Expression<Func<Location, bool>> whereCondition );
        Location SelectRecord( int id );
        Location SelectRecord( Expression<Func<Location, bool>> whereCondition );
        void Save( Location entity );
        void Save( Location entity, bool isDetachedFromDatabase );
        void Delete( Location entity );
        //string[] SelectLocationNameTownList();
        //string[] SelectLocationNameList( string q );
        //string[] SelectLocationAreaList( string q );
        string[] SelectLocationNameAndAreaList( string q );
        IEnumerable<Location> SelectRecordListByFeed( Expression<Func<FeedLocation, bool>> whereCondition );
    }
}