using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace Jumblist.Data.Entity
{
    public class NearestPostsResult
    {

        private int postId;

        public NearestPostsResult()
        {
        }

        [Column(Storage = "postId", DbType = "Int NOT NULL")]
        public int PostId
        {
            get
            {
                return this.postId;
            }
            set
            {
                if ((this.postId != value))
                {
                    this.postId = value;
                }
            }
        }
    }
}
