﻿using Application.ViewModels.Feedback;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.IServices
{
    public interface IFeedbackService
    {
        Task AddNewFeedbackAsync(FeedbackAddVM feedbackVM);
    }
}
