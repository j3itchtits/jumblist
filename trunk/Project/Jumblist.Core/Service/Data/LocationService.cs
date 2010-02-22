﻿using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Repository;
using xVal.ServerSide;
using StuartClode.Mvc.Service.Bing;
using StuartClode.Mvc.Extension;

namespace Jumblist.Core.Service.Data
{
    public class LocationService : DataService<Location>, ILocationService
    {
        public LocationService( IRepository<Location> repository )
            : base( repository )
        {
        }

        #region ILocationService Members

        public override IQueryable<Location> SelectList()
        {
            return base.SelectList();
        }

        public override Location Select( int id )
        {
            return base.Select( id );
        }

        public override Location Select(string name)
        {
            return base.Select(name);
        }

        public override void Save( Location entity )
        {
            ValidateBusinessRules( entity );

            var bingLocationService = new BingLocationService( entity.BingSearch );
            entity.Latitude = bingLocationService.Latitude;
            entity.Longitude = bingLocationService.Longitude;

            entity.FriendlyUrl = entity.Name.ToFriendlyUrl();

            base.Save( entity );
        }

        public override void Delete( Location entity )
        {
            base.Delete( entity );
        }

        public string[] FindLocations(string q)
        {
            return SelectList()
                .Where(r => r.Name.StartsWith(q))
                .Select(r => r.Name)
                .ToArray();
        }

        #endregion

        private void ValidateBusinessRules( Location entity )
        {
            IQueryable<Location> list;

            if (entity.LocationId == 0)
                list = SelectList();
            else
                list = SelectList().Where( p => p.LocationId != entity.LocationId );

            if (list.Any<Location>( p => p.Name == entity.Name ))
                throw new RulesException( "Name", "Duplicate Location Name", entity );
        }

    }
}
