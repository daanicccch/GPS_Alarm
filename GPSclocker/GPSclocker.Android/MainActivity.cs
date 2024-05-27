using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using Android.Runtime;
using Android.Widget;
using GPSclocker.Models;
using GPSclocker.Services;
using GPSclocker.Views;
using System;
using System.Security.Claims;
using Xamarin.Essentials;
using Xamarin.Forms;
using System.Threading.Tasks;
using GPSclocker.ViewModels;
using Android.Media;
using Android.Support.V4.App;

namespace GPSclocker.Droid
{
    [Activity(Label = "GPSclocker", Icon = "@mipmap/icon", Theme = "@style/MainTheme", MainLauncher = true, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode | ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize)]
    public class MainActivity : global::Xamarin.Forms.Platform.Android.FormsAppCompatActivity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            Xamarin.FormsGoogleMaps.Init(this, savedInstanceState);
            global::Xamarin.Forms.Forms.Init(this, savedInstanceState);

            // Регистрация GpsMockDataStore
            Xamarin.Forms.DependencyService.Register<GpsMockDataStore>();
            Xamarin.Forms.DependencyService.Register<NotificationService>();

            // Создание канала уведомлений
            CreateNotificationChannel();

            LoadApplication(new App());
        }

        protected override async void OnPause()
        {
            base.OnPause();
            var dataStore = new GpsMockDataStore();
            var gpsItemsTask = dataStore.GetActiveItemsAsync();
            var gpsItems = await gpsItemsTask;

            var dataStore2 = new MockDataStore();
            var ItemsTask = dataStore2.GetActiveItemsAsync();

            var Items = await ItemsTask;
            foreach (var item in Items)
            {
                SetAlarmTimer(item);
            }
            foreach (var item in gpsItems)
            {
                SetAlarmByLocation(item);
            }


        }
        public async Task SetAlarmByLocation(GpsItem alarm)
        {

            Location alarmLocation = new Location(alarm.Latitude, alarm.Longitude);
            double distanceThreshold = 0.1;


            await Task.Delay(TimeSpan.FromSeconds(3));

            Location currentLocation = await GetDeviceLocation();

            if (currentLocation != null && currentLocation.CalculateDistance(alarmLocation, DistanceUnits.Kilometers) < distanceThreshold)
            {
                if (alarm.IsEnabled)
                {
                    alarm.IsEnabled = false;
                    SendNotification("Будильник", alarm.Adress);
                }

            }
        }
        public void SetAlarmTimer(Item alarm)
        {
            DateTime alarmDateTime;
            alarmDateTime = DateTime.Today.Add(alarm.Time);

            if (alarmDateTime <= DateTime.Now)
            {
                alarmDateTime = DateTime.Today.Add(alarm.Time).AddDays(1);
            }

            TimeSpan timeUntilAlarm = alarmDateTime - DateTime.Now;
            Task.Delay(timeUntilAlarm).ContinueWith(task =>
            {
                if (alarm.IsEnabled)
                {
                    alarm.IsEnabled = false;
                    SendNotification("Будильник", alarm.Time.ToString(@"hh\:mm"));
                }
            });
        }
        private async Task<Location> GetDeviceLocation()
        {
            var location = await Geolocation.GetLastKnownLocationAsync();
            return location;
        }
        // Метод для создания канала уведомлений
        private void CreateNotificationChannel()
        {
            if (Build.VERSION.SdkInt < BuildVersionCodes.O)
            {
                return;
            }

            string channelId = "channel_id";
            string channelName = "My Channel";
            string channelDescription = "This is my channel";

            NotificationImportance channelImportance = NotificationImportance.Default;

            NotificationChannel notificationChannel = new NotificationChannel(channelId, channelName, channelImportance)
            {
                Description = channelDescription
            };

            NotificationManager notificationManager = (NotificationManager)GetSystemService(NotificationService);
            notificationManager.CreateNotificationChannel(notificationChannel);
        }

        public void SendNotification(string title, string message)
        {
            Intent intent = new Intent(this, typeof(MainActivity));

            intent.AddFlags(ActivityFlags.ClearTop);
            PendingIntent pendingIntent = PendingIntent.GetActivity(this, 0, intent, PendingIntentFlags.OneShot);

            // Загрузка звука уведомления из ресурсов
            Android.Net.Uri soundUri = Android.Net.Uri.Parse("android.resource://raw/alarm_sound");

            NotificationCompat.Builder notificationBuilder = new NotificationCompat.Builder(this, "channel_id")
                .SetSmallIcon(Resource.Drawable.icon)
                .SetContentTitle(title)
                .SetContentText(message)
                .SetAutoCancel(true)
                .SetContentIntent(pendingIntent)
                .SetSound(soundUri) // Установка звука уведомления
                .SetPriority(NotificationCompat.PriorityHigh); // Установка приоритета для отображения уведомления на экране

            NotificationManagerCompat notificationManager = NotificationManagerCompat.From(this);

            notificationManager.Notify(0, notificationBuilder.Build());
        }



        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}
