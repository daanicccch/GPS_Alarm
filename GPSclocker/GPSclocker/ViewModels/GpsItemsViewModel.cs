using GPSclocker.Models;
using GPSclocker.Views;
using GPSclocker.Services;
using System;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Threading.Tasks;
using Xamarin.Forms;
using Xamarin.Forms.GoogleMaps;

namespace GPSclocker.ViewModels
{
    class GpsItemsViewModel : GpsBaseViewMosel
    {
        private GpsItem _selectedItem;
        private GpsAlarmService alarmService = new GpsAlarmService();
        private Page currentPage;
        public ObservableCollection<GpsItem> GpsItems { get; }
        public Command LoadItemsCommand { get; }
        public Command AddItemCommand { get; }
        public Command<GpsItem> ItemTapped { get; }

        public GpsItemsViewModel(Page currentPage)
        {
            Title = "Cloks";
            GpsItems = new ObservableCollection<GpsItem>();
            this.currentPage = currentPage;
            LoadItemsCommand = new Command(async () => await ExecuteLoadItemsCommand());
            ItemTapped = new Command<GpsItem>(OnItemSelected);
            AddItemCommand = new Command(OnAddItem);
        }

        public async void OnSwitchToggled(object sender, ToggledEventArgs e)
        {
            if (sender is Xamarin.Forms.Switch switchControl)
            {
                if (switchControl.BindingContext is GpsItem selectedItem)
                {
                    selectedItem.IsEnabled = e.Value; 
                    await DataStore.UpdateItemAsync(selectedItem); 
                    if (e.Value)
                    {
                        SwitchEnabledLogic(selectedItem);
                    }
                    else
                    {
                        SwitchDisabledLogic(selectedItem);
                    }
                }
            }
        }

        private void SwitchEnabledLogic(GpsItem alarm)
        {
            if (alarm != null)
            {
                alarm.IsEnabled = true;
                alarmService.SetAlarmByLocation(alarm);
            }
            else
            {
                currentPage.DisplayAlert("Error", "No alarm selected", "OK");
            }
        }

        private void SwitchDisabledLogic(GpsItem alarm)
        {
            if (alarm != null)
            {
                alarm.IsEnabled = false;
                alarmService.CancelAlarmByLocation(alarm);
            }
            else
            {
                currentPage.DisplayAlert("Error", "No alarm selected", "OK");
            }
        }

        async Task ExecuteLoadItemsCommand()
        {
            IsBusy = true;

            try
            {
                if (DataStore == null)
                {
                    Debug.WriteLine("DataStore is null.");
                    return;
                }

                GpsItems.Clear();
                var items = await DataStore.GetItemsAsync(true);

                foreach (var item in items)
                {
                    GpsItems.Add(item);
                }

                Debug.WriteLine($"Loaded {GpsItems.Count} items.");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error loading items: {ex}");
            }
            finally
            {
                IsBusy = false;
            }
        }


        public void OnAppearing()
        {
            IsBusy = true;
            SelectedItem = null;
        }

        public GpsItem SelectedItem
        {
            get => _selectedItem;
            set
            {
                SetProperty(ref _selectedItem, value);
                OnItemSelected(value);
            }
        }

        private async void OnAddItem(object obj)
        {
            await Shell.Current.GoToAsync(nameof(GpsNewItemPage));
        }

        async void OnItemSelected(GpsItem item)
        {
            if (item == null)
                return;



            await Shell.Current.GoToAsync($"{nameof(GpsItemDetailPage)}?{nameof(GpsItemDetailViewModel.ItemId)}={item.Id}");
        }
    }
}
