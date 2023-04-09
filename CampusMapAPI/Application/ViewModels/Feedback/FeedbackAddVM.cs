using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.ViewModels.Feedback
{
    public class FeedbackAddVM
    {
        public int Ratings { get; set; }
        public string CreateDate { get; set; }
        public string? Content { get; set; }
    }
}
