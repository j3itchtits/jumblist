using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Repository;
using xVal.ServerSide;

namespace Jumblist.Core.Service.Data
{
    public class RoleService : DataService<Role>, IRoleService
    {
        public RoleService( IRepository<Role> repository )
            : base( repository )
        {
        }

        #region IRoleService Members

        public override IQueryable<Role> SelectList()
        {
            return base.SelectList();
        }

        public override Role Select( int id )
        {
            return base.Select( id );
        }

        public override void Save( Role entity )
        {
            ValidateBusinessRules( entity );
            base.Save( entity );
        }

        public override void Delete( Role entity )
        {
            base.Delete( entity );
        }

        #endregion

        private void ValidateBusinessRules( Role entity )
        {
            IQueryable<Role> list;

            if (entity.RoleId == 0)
                list = SelectList();
            else
                list = SelectList().Where( p => p.RoleId != entity.RoleId );

            if (list.Any<Role>( p => p.Name == entity.Name ))
                throw new RulesException( "Name", "Duplicate Role Name", entity );
        }
    }
}
