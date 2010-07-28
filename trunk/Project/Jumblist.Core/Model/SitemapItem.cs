using System;

namespace Jumblist.Core.Model
{
    public class SitemapItem : ISitemapItem
    {
        public SitemapItem( string url )
        {
            Url = url;
        }

        public string Url { get; set; }
        public DateTime? LastModified { get; set; }
        public ChangeFrequency? ChangeFrequency { get; set; }
        public float? Priority { get; set; }
    }

    public enum ChangeFrequency
    {
        Always,
        Hourly,
        Daily,
        Weekly,
        Monthly,
        Yearly,
        Never
    }
}
