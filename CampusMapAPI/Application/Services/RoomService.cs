using Application.IRepositories;
using Application.IServices;
using Application.ViewModels;
using Dijkstra.NET.Graph;
using Dijkstra.NET.ShortestPath;
using Domain.Models;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Services
{
    public partial class RoomService : IRoomService
    {
        private readonly IUnitOfWork _unitOfWork;

        public RoomService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<List<Room>> GetAllAsync() => await _unitOfWork.RoomRepository.GetAllAsync();

        public async Task<List<DirectionGuideViewModel>> GetRoomDirections(int fromLocationId, int toLocationId)
        {
            IEnumerable<Location> locationRoute = null;

            var fromLocation = await _unitOfWork.RoomRepository.GetByIdAsync(fromLocationId);
            var toLocation = await _unitOfWork.RoomRepository.GetByIdAsync(toLocationId);

            var graph = new Graph<int, string>();
            var locationList = await _unitOfWork.LocationRepository.GetAllAsync();
            foreach (var location in locationList)
            {
                graph.AddNode(location.Id);
            }

            for (int i = 0; i < locationList.Count; i++)
            {
                for (int j = 0; j < locationList.Count; j++)
                {
                    var XDifference =
                        Math.Abs(locationList[i].XCoordinate - locationList[j].XCoordinate);

                    var YDifference =
                        Math.Abs(locationList[i].YCoordinate - locationList[j].YCoordinate);

                    if (XDifference == 1 && YDifference == 0
                        && (locationList[i].Floor == locationList[j].Floor))
                    {
                        var distance = GetDistance(locationList[i], locationList[j]);
                        graph.Connect(
                            (uint)locationList[i].Id,
                            (uint)locationList[j].Id,
                            distance, "");
                    }
                    if (YDifference == 1 && XDifference == 0
                        && (locationList[i].Floor == locationList[j].Floor))
                    {
                        var distance = GetDistance(locationList[i], locationList[j]);
                        graph.Connect(
                            (uint)locationList[i].Id,
                            (uint)locationList[j].Id,
                            distance, "");
                    }
                }
            }

            graph = await ConnectAdditionalEdges(graph, locationList);
            ShortestPathResult result = graph.Dijkstra(
                        (uint)fromLocation.LocationId,
                        (uint)toLocation.LocationId); //result contains the shortest path

            var path = result.GetPath().ToList();

            locationRoute = path.Select(x => locationList[(int)x - 1]);

            var locationGuide = GetOptimizedDirection(locationRoute.ToList());
            return locationGuide;
        }

        public int GetDistance(Location location1, Location location2)
        {
            var XDifference = location1.XCoordinate - location2.XCoordinate;
            var YDifference = location1.YCoordinate - location2.YCoordinate;
            var floorDifference = location1.Floor - location2.Floor;
            var distance = Math.Sqrt(Math.Pow(XDifference, 2) + Math.Pow(YDifference, 2) + Math.Pow((double)floorDifference, 2));

            return Convert.ToInt32(distance);
        }

        public List<DirectionGuideViewModel> GetOptimizedDirection(List<Location> locations)
        {
            var directionGuide = new List<DirectionGuideViewModel>();
            directionGuide.Add(new DirectionGuideViewModel
            {
                Location = locations.ElementAt(0),
                Floor = (int)locations.ElementAt(0).Floor
            });
            var index = 1;
            while (index < locations.Count() - 1)
            {
                var currentLocation = locations.ElementAt(index);
                var prevLocation = locations.ElementAt(index - 1);
                var nextLocation = locations.ElementAt(index + 1);

                var isStraight =
                    ((currentLocation.XCoordinate == prevLocation.XCoordinate) &&
                    (currentLocation.XCoordinate == nextLocation.XCoordinate))
                    ||
                    ((currentLocation.YCoordinate == prevLocation.YCoordinate) &&
                    (currentLocation.YCoordinate == nextLocation.YCoordinate));

                var hasGoUpOrDown = (prevLocation.Floor != currentLocation.Floor);
                var isStillClimb = (prevLocation.Floor > currentLocation.Floor && currentLocation.Floor > nextLocation.Floor)
                    || (prevLocation.Floor < currentLocation.Floor && currentLocation.Floor < nextLocation.Floor);

                if (isStillClimb)
                {
                    locations.RemoveAt(index);
                }
                else if (!isStraight || hasGoUpOrDown)
                {

                    var direction = GetTurningDirection(currentLocation, prevLocation, nextLocation);
                    index++;
                    directionGuide.Add(new DirectionGuideViewModel
                    {
                        Location = currentLocation,
                        Floor = (int)currentLocation.Floor,
                        DirectionGuide = $"{direction} tại {currentLocation.Name} {(hasGoUpOrDown ? $"tới tầng {(nextLocation.Floor != 0 ? nextLocation.Floor : "G")}" : "")}"
                    });
                }
                else
                {
                    index++;
                    directionGuide.Add(new DirectionGuideViewModel
                    {
                        Location = currentLocation,
                        Floor = (int)currentLocation.Floor
                    });
                }
            }
            directionGuide.Add(new DirectionGuideViewModel
            {
                Location = locations.ElementAt(locations.Count() - 1),
                 Floor = (int)locations.ElementAt(locations.Count() - 1).Floor

            });

            #region Set first direction guide
            index = 0;
            while (index < locations.Count() - 2)
            {
                var prevLocation = (index > 0) ? locations.ElementAt(index - 1) : null;
                var currentLocation = locations.ElementAt(index);
                var nextLocation = locations.ElementAt(index + 1);
                var farLocation = locations.ElementAt(index + 2);

                var isStraight =
                    ((nextLocation.XCoordinate == currentLocation.XCoordinate) &&
                    (nextLocation.XCoordinate == farLocation.XCoordinate) &&
                    (nextLocation.Floor == farLocation.Floor))
                    ||
                    ((nextLocation.YCoordinate == currentLocation.YCoordinate) &&
                    (nextLocation.YCoordinate == farLocation.YCoordinate) &&
                    (nextLocation.Floor == farLocation.Floor));
                var hasGoUpOrDown = (prevLocation != null) ? currentLocation.Floor != prevLocation.Floor : false;
                if (!isStraight && !hasGoUpOrDown)
                {
                    directionGuide
                        .ElementAt(index)
                        .DirectionGuide =
                        $"Đi thẳng tới {directionGuide.ElementAt(index + 1).Location.Name}";
                }
                index++;
            }

            directionGuide
                .ElementAt(index + 1)
                .DirectionGuide =
                $"Đi thẳng tới {directionGuide.ElementAt(index + 1).Location.Rooms.FirstOrDefault().Name}";

            #endregion
            return directionGuide;
        }
        public string GetTurningDirection(
            Location currentLocation,
            Location prevLocation,
            Location nextLocation)
        {
            string direction = "";

            var p1p3 = new
            {
                x = nextLocation.XCoordinate - prevLocation.XCoordinate,
                y= nextLocation.YCoordinate - prevLocation.YCoordinate
            };
            var p1p2 = new
            {
                x = currentLocation.XCoordinate - prevLocation.XCoordinate,
                y = currentLocation.YCoordinate - prevLocation.YCoordinate
            };
            var directionValue = p1p3.x*p1p2.y-p1p3.y*p1p2.x;  

            if (directionValue < 0) direction = "Rẽ trái";
            if (directionValue > 0) direction = "Rẽ phải";
            if (prevLocation.Floor - currentLocation.Floor < 0) direction = "Đi lên";
            if (prevLocation.Floor - currentLocation.Floor > 0) direction = "Đi xuống";

            return direction;
        }

    }
}
