using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Repository;
using xVal.ServerSide;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service
{
    public class RoleService : DataService<Role>, IRoleService
    {
        public RoleService( IRepository<Role> repository )
            : base( repository )
        {
        }

        #region IRoleService Members

        public override IQueryable<Role> SelectRecordList()
        {
            return base.SelectRecordList();
        }

        public override IQueryable<Role> SelectRecordList( Expression<Func<Role, bool>> whereCondition )
        {
            return base.SelectRecordList( whereCondition );
        }

        public override Role SelectRecord( int id )
        {
            return base.SelectRecord( id );
        }

        public override Role SelectRecord( Expression<Func<Role, bool>> whereCondition )
        {
            return base.SelectRecord( whereCondition );
        }

        public override void Save( Role role )
        {
            ValidateBusinessRules( role );
            base.Save( role );
        }

        public override void Update( Role role )
        {
            base.Update( role );
        }

        public override void Delete( Role role )
        {
            base.Delete( role );
        }

        #endregion

        private void ValidateBusinessRules( Role role )
        {
            var list = base.IsNew( role ) ? SelectRecordList() : SelectRecordList( Role.WhereNotEquals( role ) );

            if ( base.IsDuplicate( list, Role.WhereNameEquals( role.Name ) ) )
            {
                throw new RulesException( "Name", "Duplicate Role Name", role );
            }
        }
    }
}
