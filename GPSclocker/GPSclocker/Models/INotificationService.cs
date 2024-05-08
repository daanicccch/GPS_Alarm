using System;
using System.Collections.Generic;
using System.Text;

namespace GPSclocker.Models
{
    public interface INotificationService
    {
        void SendNotification(string title, string message);
        bool IsAppInBackground();
    }
}
