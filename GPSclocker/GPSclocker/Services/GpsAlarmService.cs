using GPSclocker.Models;
using GPSclocker.ViewModels;
using GPSclocker.Views;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Essentials;
using Xamarin.Forms;
using Xamarin.Forms.GoogleMaps;

namespace GPSclocker.Services
{
    public class GpsAlarmService
    {
        private bool isRunning = false;
        public async Task SetAlarmByLocation(GpsItem alarm)
        {
            if (isRunning)
                return;

            isRunning = true;

            Location alarmLocation = new Location(alarm.Latitude, alarm.Longitude);
            double distanceThreshold = 0.1; 

            while (isRunning)
            {
                await Task.Delay(TimeSpan.FromSeconds(3)); 

                Location currentLocation = await GetDeviceLocation();
                if (currentLocation != null && currentLocation.CalculateDistance(alarmLocation, DistanceUnits.Kilometers) < distanceThreshold)
                {
                    if (alarm.IsEnabled)
                    {
                        alarm.IsEnabled = false;
                        await Shell.Current.GoToAsync($"{nameof(GpsWakeUpPage)}?{nameof(GpsWakeUpPageViewModel.ItemId)}={alarm.Id}");
                        
                    }

                    isRunning = false; 
                }
            }
        }

        public void CancelAlarmByLocation(GpsItem alarm)
        {
            alarm.IsEnabled = false;
        }

        private async Task<Location> GetDeviceLocation()
        {
                var location = await Geolocation.GetLastKnownLocationAsync();
                return location;
        }

        private void ShowMessageBox(string title, string message)
        {
            Device.BeginInvokeOnMainThread(async () =>
            {
                await App.Current.MainPage.DisplayAlert(title, message, "OK");
            });
        }
    }
}
