using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Interface
{
    public interface IFeedRepository
    {
        //Query Lists
        IQueryable<Feed> Feeds { get; }
        IQueryable<Feed> SelectFeeds();

        //Query Item
        Feed SelectFeed(int id);
        Feed SelectFeed(string url);

        // Insert/Delete
        void Add(Feed feed);
        void Delete(Feed feed);

        // Persistence
        void Save();


    }
}
