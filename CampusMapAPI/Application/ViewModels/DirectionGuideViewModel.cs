using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.ViewModels
{
    public class DirectionGuideViewModel
    {
        public Location Location { get; set; }
        public int Floor { get; set; }
        public string DirectionGuide { get; set; }
    }
}
