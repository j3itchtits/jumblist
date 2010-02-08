using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Extension;
using xVal.ServerSide;
using System.Text.RegularExpressions;

namespace Jumblist.Core.Service.Data
{
    public class PostService : DataService<Post>, IPostService
    {
        public IDataService<PostLocation> postLocationDataService;
        public IDataService<Location> locationDataService;
        public IDataService<PostTag> postTagDataService;
        public IDataService<Tag> tagDataService;

        public PostService(
            IRepository<Post> repository, 
            IDataService<PostLocation> postLocationDataService,
            IDataService<Location> locationDataService,
            IDataService<PostTag> postTagDataService,
            IDataService<Tag> tagDataService
            )
            : base( repository )
        {
            this.postLocationDataService = postLocationDataService;
            this.locationDataService = locationDataService;
            this.postTagDataService = postTagDataService;
            this.tagDataService = tagDataService;
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
            if (string.IsNullOrEmpty(entity.Guid))
                entity.Guid = entity.Url;

            bool newEntity = (entity.PostId == 0);

            ValidateBusinessRules( entity );

            base.Save( entity );

            if (newEntity)
            {
                SavePostLocations(entity);
                SavePostTags(entity);  
            }

        }

        public override void Delete( Post entity )
        {
            base.Delete( entity );
        }

        public IEnumerable<Post> SelectPostsByLocation(int locationId)
        {
            return from p in SelectList().AsEnumerable()
                   join pl in postLocationDataService.SelectList().AsEnumerable() on p.PostId equals pl.PostId
                   where pl.LocationId == locationId
                   select p;
        }

        public IEnumerable<Post> SelectPostsByLocation(string locationName)
        {
            return from p in SelectList().AsEnumerable()
                   join pl in postLocationDataService.SelectList().AsEnumerable() on p.PostId equals pl.PostId
                   join l in locationDataService.SelectList().AsEnumerable() on pl.LocationId equals l.LocationId
                   where l.Name.ToFriendlyUrl() == locationName
                   select p;
        }

        public IEnumerable<Post> SelectPostsByTag(int tagId)
        {
            return from p in SelectList().AsEnumerable()
                   join pt in postTagDataService.SelectList().AsEnumerable() on p.PostId equals pt.PostId
                   where pt.TagId == tagId
                   select p;
        }

        public IEnumerable<Post> SelectPostsByTag(string tagName)
        {
            return from p in SelectList().AsEnumerable()
                   join pt in postTagDataService.SelectList().AsEnumerable() on p.PostId equals pt.PostId
                   join t in tagDataService.SelectList().AsEnumerable() on pt.TagId equals t.TagId
                   where t.Name.ToFriendlyUrl() == tagName
                   select p;
        }

        public bool IsDuplicate(IQueryable<Post> list, string id)
        {
            return list.Any<Post>(p => p.Guid == id);
        }

        public string[] FindLocations(string q)
        {
            return locationDataService.SelectList()
                .Where(r => r.Name.StartsWith(q))
                .Select(r => r.Name)
                .ToArray();
        }

        public string[] FindTags(string q)
        {
            return tagDataService.SelectList()
                .Where(r => r.Name.StartsWith(q))
                .Select(r => r.Name)
                .ToArray();
        }

        #endregion

        private void ValidateBusinessRules( Post entity )
        {
            IQueryable<Post> list;

            if (entity.PostId == 0)
                list = SelectList();
            else
                list = SelectList().Where( p => p.PostId != entity.PostId );

            if ( IsDuplicate( list, entity.Guid ) )
                throw new RulesException( "Post", "Duplicate Post", entity );
        }

        private void SavePostLocations(Post entity)
        {
            string search = entity.Title + " " + entity.Body;

            foreach (string l in Locations())
            {
                if (Regex.IsMatch(search, l, RegexOptions.IgnoreCase))
                {
                    var locationItem = locationDataService.Select(l);
                    var postLocationItem = new PostLocation { PostId = entity.PostId, LocationId = locationItem.LocationId };
                    postLocationDataService.Save(postLocationItem);
                }
            }
        }

        private void SavePostTags(Post entity)
        {
            string search = entity.Title + " " + entity.Body;

            foreach (string t in Tags())
            {
                if (Regex.IsMatch(search, t, RegexOptions.IgnoreCase))
                {
                    var tagItem = tagDataService.Select(t);
                    var postTagItem = new PostTag { PostId = entity.PostId, TagId = tagItem.TagId };
                    postTagDataService.Save(postTagItem);
                }
            }
        }

        private string[] Locations()
        {
            return locationDataService.SelectList()
                .Select(r => r.Name)
                .ToArray();
        }

        private string[] Tags()
        {
            return tagDataService.SelectList()
                .Select(r => r.Name)
                .ToArray();
        }

        
    }
}
