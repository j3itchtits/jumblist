﻿using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service;
using StuartClode.Mvc.Repository;

namespace Jumblist.Core.Service
{
    public class PostService : DataService<Post>, IPostService
    {
        public PostService( IRepository<Post> repository )
            : base( repository )
        {
        }

        #region IPostService Members

        public override IQueryable<Post> SelectList()
        {
            return base.SelectList();
        }

        public override Post Select( int id )
        {
            return base.Select( id );
        }

        public override void Save( Post entity )
        {
            ValidateBusinessRules( entity );
            base.Save( entity );
        }

        public override void Delete( Post entity )
        {
            base.Delete( entity );
        }

        public void ValidateBusinessRules( Post entity )
        {
        }

        #endregion
    }
}
