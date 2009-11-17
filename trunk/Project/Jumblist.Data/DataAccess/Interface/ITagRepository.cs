﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Model;

namespace Jumblist.Data.DataAccess.Interface
{
    public interface ITagRepository
    {
        //Query Lists
        IQueryable<Tag> SelectTags();
        IQueryable<Tag> SelectTopLevelTags();

        //Query Item
        Tag SelectTag( int id );
        Tag SelectTag( string name );

        // Insert/Delete
        void Add( Tag tag );
        void Delete( Tag tag );

        // Persistence
        void Save();


    }
}
