using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Repository;
using xVal.ServerSide;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service.Data
{
    public class TagService : DataService<Tag>, ITagService
    {
        public TagService( IRepository<Tag> repository )
            : base( repository )
        {
        }

        #region ITagService Members

        public override IQueryable<Tag> SelectList()
        {
            return base.SelectList();
        }

        public IQueryable<Tag> SelectList( Expression<Func<Tag, bool>> whereCondition )
        {
            return from x in SelectList().Where( whereCondition )
                   select x;
        }

        public override Tag Select( int id )
        {
            return base.Select( id );
        }

        public override Tag Select(string name)
        {
            return base.Select(name);
        }

        public override void Save( Tag entity )
        {
            ValidateBusinessRules( entity );
            base.Save( entity );
        }

        public override void Update(Tag entity)
        {
            base.Update(entity);
        }

        public override void Delete( Tag entity )
        {
            base.Delete( entity );
        }

        public string[] FindTags(string q)
        {
            return SelectList()
                .Where(r => r.Name.StartsWith(q))
                .Select(r => r.Name)
                .ToArray();
        }

        #endregion

        private void ValidateBusinessRules( Tag entity )
        {
            IQueryable<Tag> list;

            if (entity.TagId == 0)
                list = SelectList();
            else
                list = SelectList().Where( p => p.TagId != entity.TagId );

            if (base.IsDuplicate(Tag.Duplicate(entity.Name)))
            {
                throw new RulesException("Name", "Duplicate Tag Name", entity);
            }
        }
    }
}
