using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Repository;
using xVal.ServerSide;
using StuartClode.Mvc.Service.Map;
using StuartClode.Mvc.Extension;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service
{
    public class LocationService : DataService<Location>, ILocationService
    {
        public IDataService<FeedLocation> feedLocationDataService;

        public LocationService( IRepository<Location> repository, IDataService<FeedLocation> feedLocationDataService )
            : base( repository )
        {
            this.feedLocationDataService = feedLocationDataService;
        }

        #region ILocationService Members

        public override IQueryable<Location> SelectRecordList()
        {
            return base.SelectRecordList();
        }

        public override IQueryable<Location> SelectRecordList( Expression<Func<Location, bool>> whereCondition )
        {
            return base.SelectRecordList( whereCondition );
        }

        public override Location SelectRecord( int id )
        {
            return base.SelectRecord( id );
        }

        public override Location SelectRecord( Expression<Func<Location, bool>> whereCondition )
        {
            return base.SelectRecord( whereCondition );
        }

        public override void Save( Location location )
        {
            ValidateBusinessRules( location );

            var bingLocationService = new BingLocationService( location.BingSearch );
            location.Latitude = bingLocationService.Latitude;
            location.Longitude = bingLocationService.Longitude;

            location.FriendlyUrl = location.Name.ToFriendlyUrlEncode();

            base.Save( location );
        }

        public override void Update( Location location )
        {
            base.Update( location );
        }

        public override void Delete( Location location )
        {
            base.Delete( location );
        }

        public string[] SelectLocationNameTownList()
        {
            var locationList = from l in SelectRecordList()
                               select l.NameSearch;

            return locationList.Distinct().ToArray();
        }

        public string[] SelectLocationNameList( string q )
        {
            var locationList = from l in SelectRecordList()
                               where l.Name.StartsWith( q ) && (l.Area != null)
                               select l.Name;

            return locationList.Distinct().ToArray();
        }

        public string[] SelectLocationAreaList( string q )
        {
            var locationList = from l in SelectRecordList()
                               where l.Area.StartsWith( q )
                               select l.Area;

            return locationList.Distinct().ToArray();
        }

        public string[] SelectLocationNameAndAreaList( string q )
        {
            var locationList = from l in SelectRecordList()
                               where l.Name.StartsWith( q )
                               select new { FullLocationName = l.Name + ((l.Area == null) ? string.Empty : StringExtensions.FieldSeparator + l.Area) };

            //need this to convert IQueryable<AnonymousType> into IQueryable<string>
            return locationList.Select( r => r.FullLocationName ).ToArray();
        }

        public IEnumerable<Location> SelectRecordListByFeed( Expression<Func<FeedLocation, bool>> whereCondition )
        {
            return from l in SelectRecordList().AsEnumerable()
                   join fl in feedLocationDataService.SelectRecordList( whereCondition ).AsEnumerable() on l.LocationId equals fl.LocationId
                   select l;
        }

        #endregion

        private void ValidateBusinessRules( Location location )
        {
            var list = base.IsNew( location ) ? SelectRecordList() : SelectRecordList( Location.WhereNotEquals( location ) );

            if (base.IsDuplicate( list, Location.WhereEquals( location.Name, location.Area ) ))
            {
                throw new RulesException( "Name", "Duplicate Location Name", location );
            }
        }

    }
}