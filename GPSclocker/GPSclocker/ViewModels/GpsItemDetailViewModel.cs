using GPSclocker.Models;
using GPSclocker.ViewModels;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Xamarin.Essentials;
using Xamarin.Forms;
using System.Linq;
using Xamarin.Forms.GoogleMaps;
using System.Net.NetworkInformation;
using System.Collections.ObjectModel;

namespace GPSclocker.ViewModels
{
    [QueryProperty(nameof(ItemId), nameof(ItemId))]
    public class GpsItemDetailViewModel : GpsBaseViewMosel
    {
        private string itemId;
        private string adress;
        private string description;
        private Pin currentPin;
        private Xamarin.Forms.GoogleMaps.Map map; // Поле для хранения ссылки на карту
        private Page currentPage;
        private ObservableCollection<Pin> pins = new ObservableCollection<Pin>();


        public GpsItemDetailViewModel(Xamarin.Forms.GoogleMaps.Map map, Page currentPage)
        {   
            this.map = map;
            this.currentPage = currentPage;
            SaveCommand = new Command(OnSave, ValidateSave);
            DeleteCommand = new Command(OnDelete);
        }

        public ObservableCollection<Xamarin.Forms.GoogleMaps.Pin> Pins
        {
            get => pins;
            set => SetProperty(ref pins, value);
        }
        public async void Map_MapClicked(object sender, MapClickedEventArgs e)
        {
            map.Pins.Clear();
            var position = new Position(e.Point.Latitude, e.Point.Longitude);

            // Выполним геокодирование для получения адреса
            var addresses = await new Geocoder().GetAddressesForPositionAsync(position);

            string address = addresses.FirstOrDefault() ?? "Unknown Address";

            currentPin = new Pin
            {
                Type = PinType.Place,
                Position = position,
                Label = "Selected Location",
                Address = address
            };


            Pins.Add(currentPin);

            map.Pins.Add(currentPin);
        }
        private async void GetLocationAsync(Position position)
        {
            var current = Connectivity.NetworkAccess;
            if (current != NetworkAccess.Internet)
            {  
                await currentPage.DisplayAlert("Ошибка", "Отсутствует подключение к Интернету", "OK");
                return;
            }
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
                Address = Adress 
            };

            map.Pins.Add(pin);
        }   
        
        public string Id { get; set; }
        private bool ValidateSave()
        {
            return true;
        }

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
        public Command SaveCommand { get; }
        public Command DeleteCommand { get; }
        private async void OnDelete()
        {
            DataStore.DeleteItemAsync(ItemId);
            await Shell.Current.GoToAsync("..");
        }

        private async void OnSave()
        {
            var lastPin = Pins.LastOrDefault();
            if (lastPin != null)
            {
                await DataStore.DeleteItemAsync(ItemId);

                GpsItem newItem = new GpsItem
                {
                    Id = Guid.NewGuid().ToString(),
                    Description = Description,
                    Latitude = lastPin.Position.Latitude,
                    Longitude = lastPin.Position.Longitude,
                    Adress = lastPin.Address,
                    IsEnabled = true
                };

                await DataStore.AddItemAsync(newItem);

                Pins.Add(new Pin
                {
                    Type = PinType.Place,
                    Position = new Position(newItem.Latitude, newItem.Longitude),
                    Label = newItem.Description
                });
            }
            else
            {
                var item = await DataStore.GetItemAsync(itemId);
                if (item != null)
                {
                    await DataStore.DeleteItemAsync(ItemId);
                    GpsItem newItem = new GpsItem
                    {
                        Id = Guid.NewGuid().ToString(),
                        Description = Description,
                        Latitude = item.Latitude,
                        Longitude = item.Longitude,
                        Adress = item.Adress,
                        IsEnabled = true
                    };
                    await DataStore.AddItemAsync(newItem);
                    Pins.Add(new Pin
                    {
                        Type = PinType.Place,
                        Position = new Position(newItem.Latitude, newItem.Longitude),
                        Label = newItem.Description
                    });
                }
                else
                {
                    // Обработка ситуации, когда элемент с заданным itemId не найден
                    // Можно вывести сообщение об ошибке или выполнить другие необходимые действия
                }
            }

            // Закрыть текущую страницу в стеке навигации
            await Shell.Current.GoToAsync("..");
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
                if (item != null)
                {
                    Id = item.Id;
                    Adress = item.Adress;
                    Description = item.Description;
                    var position = new Position(item.Latitude, item.Longitude);
                    GetLocationAsync(position);
                    ShowCurrentLocationOnMap(position);
                }
                else
                {
                    Debug.WriteLine("Item is null.");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error loading item: {ex.Message}");
            }
        }
    }
}