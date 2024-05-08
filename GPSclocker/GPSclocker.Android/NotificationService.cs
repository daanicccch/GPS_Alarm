using Android.App;
using Android.Content;
using GPSclocker.Models;
using GPSclocker.Services;
using System.Collections.Generic;

namespace GPSclocker.Droid
{
    public class NotificationService : INotificationService
    {
        private readonly Context context;

        public NotificationService(Context context)
        {
            this.context = context;
        }

        public void SendNotification(string title, string message)
        {
            // Создание намерения для открытия приложения при нажатии на уведомление
            Intent intent = new Intent(context, typeof(MainActivity));
            intent.AddFlags(ActivityFlags.ClearTop);
            PendingIntent pendingIntent = PendingIntent.GetActivity(context, 0, intent, PendingIntentFlags.OneShot);

            // Создание объекта уведомления
            Notification.Builder notificationBuilder = new Notification.Builder(context, "channel_id")
                .SetSmallIcon(Resource.Drawable.icon)
                .SetContentTitle(title)
                .SetContentText(message)
                .SetAutoCancel(true)
                .SetContentIntent(pendingIntent);

            // Получение менеджера уведомлений
            NotificationManager notificationManager = context.GetSystemService(Context.NotificationService) as NotificationManager;

            // Отправка уведомления
            notificationManager.Notify(0, notificationBuilder.Build());
        }

        public bool IsAppInBackground()
        {
            ActivityManager activityManager = (ActivityManager)context.GetSystemService(Context.ActivityService);
            IList<ActivityManager.RunningAppProcessInfo> runningProcesses = activityManager.RunningAppProcesses;
            if (runningProcesses != null)
            {
                foreach (var processInfo in runningProcesses)
                {
                    if (processInfo.ProcessName == context.PackageName)
                    {
                        if (processInfo.Importance != Android.App.Importance.Foreground)
                        {
                            return true;
                        }
                    }
                }
            }
            return false;
        }
    }
}
