﻿using Jumblist.Core.Model;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service
{
    public interface IFeedService
    {
        IQueryable<Feed> SelectRecordList();
        IQueryable<Feed> SelectRecordList( Expression<Func<Feed, bool>> whereCondition );
        Feed SelectRecord( int id );
        Feed SelectRecord( Expression<Func<Feed, bool>> whereCondition );
        Feed SelectRecord( string name );
        void Save( Feed entity );
        void Update( Feed entity );
        void Delete( Feed entity );
    }
}