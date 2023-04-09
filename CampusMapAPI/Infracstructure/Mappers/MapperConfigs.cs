using Application.Commons;
using AutoMapper;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Infracstructures.Mappers
{
    public partial class MapperConfigs : Profile
    {
        public MapperConfigs()
        {
            //add map here
            //CreateMap<SourceModel, DestinationModel>();

            //Add Feedback Mapper
            AddFeedbackMapperConfig();

        }

        partial void AddFeedbackMapperConfig();
    }
}
