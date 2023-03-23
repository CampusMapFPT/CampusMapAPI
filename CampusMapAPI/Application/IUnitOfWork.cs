using Application.IRepositories;

namespace Application
{
    public interface IUnitOfWork
    {
        public IBlogRepository BlogRepository { get; }
        public IEventRepository EventRepository { get; }
        public IFeedbackRepository FeedbackRepository { get; }
        public ILocationRepository LocationRepository { get; }
        public ILocationRouteRepository LocationRouteRepository { get; }
        public IRoomRepository RoomRepository { get; }

        public Task<int> SaveChangesAsync();
    }
}