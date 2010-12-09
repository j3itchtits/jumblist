using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Moq;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using StuartClode.Mvc.Service.Data;

namespace Jumblist.Tests.Mocks
{
    public class MockLocationService
    {
        private List<Location> locationList;
        private ILocationService locationService;

        public MockLocationService()
        {
            locationList = GenerateListOfLocations();
            locationService = GenerateMockLocationService( locationList );
        }

        public MockLocationService( List<Location> locationList )
        {
            locationService = GenerateMockLocationService( locationList );
        }

        public ILocationService Service
        {
            get { return locationService; }
        }

        private List<Location> GenerateListOfLocations()
        {
            return new List<Location>() { 
                new Location { Name = "Brede", FriendlyUrl = "brede", Area = "East Sussex, United Kingdom", Latitude = 50.93577012, Longitude = 0.596790165  },
                new Location { Name = "Hastings", FriendlyUrl = "hastings", Area = "East Sussex, United Kingdom", Latitude = 50.85612327, Longitude = 0.578795224  }
            };
        }

        private ILocationService GenerateMockLocationService( List<Location> listLocations )
        {
            var mockService = new Mock<ILocationService>();
            mockService.Setup( x => x.SelectRecordList() ).Returns( listLocations.AsQueryable() );
            return mockService.Object;
        }
    }
}
