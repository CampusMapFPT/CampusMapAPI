using Application;
using Application.IRepositories;
using Infracstructures.Repositories;

namespace Infracstructures
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly AppDbContext _context;
        private readonly IBlogRepository _blogRepository;
        private readonly IEventRepository _eventRepository;
        private readonly IFeedbackRepository _feedbackRepository;
        private readonly ILocationRepository _locationRepository;
        private readonly ILocationRouteRepository _locationRouteRepository;
        private readonly IRoomRepository _roomRepository;

        public UnitOfWork(
            AppDbContext context, 
            IBlogRepository blogRepository,
            IEventRepository eventRepository,
            IFeedbackRepository feedbackRepository,
            ILocationRepository locationRepository,
            IRoomRepository roomRepository,
            ILocationRouteRepository locationRouteRepository)
        {
            _context = context;
            _blogRepository = blogRepository;
            _eventRepository = eventRepository;
            _feedbackRepository = feedbackRepository;
            _locationRepository = locationRepository;
            _locationRepository = locationRepository;
            _roomRepository = roomRepository;
            _locationRouteRepository = locationRouteRepository;

        }

        IBlogRepository IUnitOfWork.BlogRepository => _blogRepository;

        IEventRepository IUnitOfWork.EventRepository => _eventRepository;

        IFeedbackRepository IUnitOfWork.FeedbackRepository => _feedbackRepository;

        ILocationRepository IUnitOfWork.LocationRepository => _locationRepository;
        ILocationRouteRepository IUnitOfWork.LocationRouteRepository => _locationRouteRepository;
        IRoomRepository IUnitOfWork.RoomRepository => _roomRepository;

        public async Task<int> SaveChangesAsync()
        {
            return await _context.SaveChangesAsync();
        }

    }
}