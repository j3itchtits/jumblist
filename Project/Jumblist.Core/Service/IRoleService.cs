using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service
{
    public interface IRoleService
    {
        IQueryable<Role> SelectRecordList();
        IQueryable<Role> SelectRecordList( Expression<Func<Role, bool>> whereCondition );
        Role SelectRecord( int id );
        Role SelectRecord( Expression<Func<Role, bool>> whereCondition );
        void Save( Role entity );
        void Update(Role entity);
        void Delete( Role entity );
    }
}
