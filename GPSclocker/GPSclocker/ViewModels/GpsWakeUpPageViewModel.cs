using GPSclocker.Models;
using GPSclocker.ViewModels;
using GPSclocker.Services;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Xamarin.Essentials;
using Xamarin.Forms;
using System.Reflection;
using System.Linq;
using Xamarin.Forms.GoogleMaps;
using System.Net.NetworkInformation;
using System.Collections.ObjectModel;


namespace GPSclocker.ViewModels
{
    [QueryProperty(nameof(ItemId), nameof(ItemId))]
    public class GpsWakeUpPageViewModel : GpsBaseViewMosel
    {
        private Page currentPage;
        private Xamarin.Forms.GoogleMaps.Map map;
        private string itemId;
        private string adress;
        private Pin currentPin;
        private string description;
        private ObservableCollection<Pin> pins = new ObservableCollection<Pin>();
        GpsAlarmService GpsAlarmService;
        public GpsWakeUpPageViewModel(Xamarin.Forms.GoogleMaps.Map map, Page currentPage)
        {
            this.map = map;
            this.currentPage = currentPage;
            GpsAlarmService = new GpsAlarmService();
        }
        public ObservableCollection<Xamarin.Forms.GoogleMaps.Pin> Pins
        {
            get => pins;
            set => SetProperty(ref pins, value);
        }
        public string Id { get; set; }
        public string Adress
        {
            get => adress;
            set => SetProperty(ref adress, value);
        }

        public string Description
        {
            get => description;
            set => SetProperty(ref description, value);
        }
        public async void offButton()
        {
            var player = Plugin.SimpleAudioPlayer.CrossSimpleAudioPlayer.Current;
            player.Stop();
            var item = await DataStore.GetItemAsync(itemId);
            GpsAlarmService.CancelAlarmByLocation(item);
            await Shell.Current.GoToAsync("..");
        }
        private async void GetLocationAsync(Position position)
        {
            var location = await Geolocation.GetLocationAsync(new GeolocationRequest
            {
                DesiredAccuracy = GeolocationAccuracy.Medium,
            });

            if (location != null)
            {
                map.MoveToRegion(MapSpan.FromCenterAndRadius(position, Distance.FromKilometers(2)));

            }
            else
            {
                await currentPage.DisplayAlert("Error", "Unable to get current location", "OK");
            }
        }

        private void ShowCurrentLocationOnMap(Position position)
        {
            map.Pins.Clear();

            var pin = new Pin
            {
                Position = position,
                Label = "Selected Location",
                Address = Description
            };

            map.Pins.Add(pin);
        }
        public string ItemId
        {
            get
            {
                return itemId;
            }
            set
            {
                itemId = value;
                LoadItemId(value);
            }
        }

        public async void LoadItemId(string itemId)
        {
            try
            {
                var item = await DataStore.GetItemAsync(itemId);
                Id = item.Id;
                Adress = item.Adress;
                Description = item.Description;
                var position = new Position(item.Latitude, item.Longitude);
                GetLocationAsync(position);
                ShowCurrentLocationOnMap(position);
            }
            catch (Exception)
            {
                Debug.WriteLine("Failed to Load Item");
            }
        }
        public async void StartAlarm()
        {

            var assembly = Assembly.GetExecutingAssembly();
            using (var stream = assembly.GetManifestResourceStream("GPSclocker.Views.Resources.signal.mp3"))
            {
                if (stream != null)
                {
                    // Воспроизводим звук
                    var player = Plugin.SimpleAudioPlayer.CrossSimpleAudioPlayer.Current;
                    player.Load(stream);
                    player.Play();
                }
                else
                {
                    await currentPage.DisplayAlert("Error", "Sound file not found", "OK");
                }
            }

        }
    }
}
