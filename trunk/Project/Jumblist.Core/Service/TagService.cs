using JumblistTest.Website.Model;
using System.Collections.Generic;
using System.Linq;
using JumblistTest.Common.Repositories;

namespace JumblistTest.Website.Services
{
    public class TagService : ITagService
    {
        private readonly IRepository<Tag> tagRepository;
        private readonly IRepository<PostTag> postTagRepository;

        public TagService( IRepository<Tag> tagRepository, IRepository<PostTag> postTagRepository )
        {
            this.tagRepository = tagRepository;
            this.postTagRepository = postTagRepository;
        }


        #region ITagService Members

        public IList<Tag> SelectList()
        {
            return tagRepository.SelectList().ToList();
        }

        public Tag Select( int id )
        {
            return tagRepository.Select( id );
        }

        public void Save( Tag entity )
        {
            if ( entity.TagId == 0 )
                tagRepository.InsertOnSubmit( entity );
            else
                tagRepository.Save( entity );

            tagRepository.SubmitChanges();
        }

        public void Delete( Tag entity )
        {
            tagRepository.DeleteOnSubmit( entity );
            tagRepository.SubmitChanges();
        }

        #endregion
    }
}
