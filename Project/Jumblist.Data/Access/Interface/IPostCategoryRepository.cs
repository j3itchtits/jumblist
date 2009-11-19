﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Entity;

namespace Jumblist.Data.Access
{
    public interface IPostCategoryRepository
    {
        //Query Lists
        IQueryable<PostCategory> PostCategories { get; }
        IQueryable<PostCategory> SelectPostCategories();
               
        //Query Item
        PostCategory SelectPostCategory(int id);
        PostCategory SelectPostCategory(string name);


        // Insert/Delete
        void Add(PostCategory postCategory);
        void Delete(PostCategory postCategory);

        // Persistence
        void Save();


    }
}