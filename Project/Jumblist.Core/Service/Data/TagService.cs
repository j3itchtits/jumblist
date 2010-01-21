using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service;
using StuartClode.Mvc.Repository;
using xVal.ServerSide;

namespace Jumblist.Core.Service.Data
{
    public class TagService : DataService<Tag>, ITagService
    {
        public TagService( IRepository<Tag> repository )
            : base( repository )
        {
        }

        #region IPostService Members

        public override IQueryable<Tag> SelectList()
        {
            return base.SelectList();
        }

        public override Tag Select( int id )
        {
            return base.Select( id );
        }

        public override void Save( Tag entity )
        {
            ValidateBusinessRules( entity );
            base.Save( entity );
        }

        public override void Delete( Tag entity )
        {
            base.Delete( entity );
        }

        public void ValidateBusinessRules( Tag entity )
        {
            IQueryable<Tag> list;

            if (entity.TagId == 0)
                list = SelectList();
            else
                list = SelectList().Where( p => p.TagId != entity.TagId );

            if (list.Any<Tag>( p => p.Name == entity.Name ))
                throw new RulesException( "Name", "Duplicate Tag Name", entity );
        }

        #endregion
    }
}
