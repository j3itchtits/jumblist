using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Extension;
using xVal.ServerSide;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service
{
    public class TagService : DataService<Tag>, ITagService
    {
        public TagService( IRepository<Tag> repository )
            : base( repository )
        {
        }

        #region ITagService Members

        public override IQueryable<Tag> SelectRecordList()
        {
            return base.SelectRecordList();
        }

        public override IQueryable<Tag> SelectRecordList( Expression<Func<Tag, bool>> whereCondition )
        {
            return base.SelectRecordList( whereCondition );
        }

        public override Tag SelectRecord( int id )
        {
            return base.SelectRecord( id );
        }

        public override Tag SelectRecord( Expression<Func<Tag, bool>> whereCondition )
        {
            return base.SelectRecord( whereCondition );
        }

        public Tag SelectRecord( string name )
        {
            return SelectRecord( Tag.WhereNameEquals( name ) );
        }

        public override void Save( Tag tag )
        {
            Save( tag, false );
        }

        public override void Save( Tag tag, bool isDetachedFromDatabase )
        {
            tag.FriendlyUrl = tag.Name.ToFriendlyUrlEncode();

            ValidateDataRules( tag );
            ValidateBusinessRules( tag ); 
            base.Save( tag, isDetachedFromDatabase );
        }

        public override void Delete( Tag tag )
        {
            base.Delete( tag );
        }

        public string[] SelectTagNameList()
        {
            return (from t in SelectRecordList()
                    select t.Name).ToArray();
        }

        public string[] SelectTagNameList( string q )
        {
            if ( string.IsNullOrEmpty( q ) )
            {
                return SelectTagNameList();
            }
            else
            {
                return (from t in SelectRecordList()
                        where t.Name.StartsWith( q )
                        select t.Name).ToArray();
            }
        }

        #endregion

        private void ValidateBusinessRules( Tag tag )
        {
            var list = base.IsNew( tag ) ? SelectRecordList() : SelectRecordList( Tag.WhereNotEquals( tag ) );

            if ( base.IsDuplicate( list, Tag.WhereNameEquals( tag.Name ) ) )
            {
                throw new RulesException( "Name", "Duplicate Tag Name", tag );
            }
        }
    }
}
