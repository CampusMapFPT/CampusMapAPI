using Dijkstra.NET.Graph;
using Dijkstra.NET.Graph.Simple;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Application.Services
{
    public partial class RoomService
    {
        public async Task<Graph<int, string>> ConnectAdditionalEdges(
            Graph<int, string> graph,
            List<Location> locationList)
        {
            var additionalRouteList = await _unitOfWork.LocationRouteRepository.GetAllAsync();

            foreach(var route in additionalRouteList)
            {
                var distance = GetDistance(
                    route.FirstLocation,
                    route.SecondLocation);
                if (route.FirstLocation.Floor != route.SecondLocation.Floor) distance *= 2;
                graph.Connect(
                    (uint)route.FirstLocationId,
                    (uint)route.SecondLocationId,
                    distance, "");
                graph.Connect(
                    (uint)route.SecondLocationId,
                    (uint)route.FirstLocationId,
                    distance, "");
            }
            return graph;
        }
    }
}
