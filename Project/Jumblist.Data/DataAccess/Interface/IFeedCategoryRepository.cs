﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Model;

namespace Jumblist.Data.DataAccess.Interface
{
    public interface IFeedCategoryRepository
    {
        //Query Lists
        IQueryable<FeedCategory> FeedCategories { get; }
        IQueryable<FeedCategory> SelectFeedCategories();
               
        //Query Item
        FeedCategory SelectFeedCategory(int id);
        FeedCategory SelectFeedCategory(string name);


        // Insert/Delete
        void Add(FeedCategory feedCategory);
        void Delete(FeedCategory feedCategory);

        // Persistence
        void Save();


    }
}
