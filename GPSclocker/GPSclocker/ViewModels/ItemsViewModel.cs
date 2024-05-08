using GPSclocker.Models;
using GPSclocker.Views;
using GPSclocker.Services;
using System;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace GPSclocker.ViewModels
{
    public class ItemsViewModel : BaseViewModel
    {
       
        private Item _selectedItem;
        private AlarmService alarmService;
        private Page currentPage;
        public ObservableCollection<Item> Items { get; }
        public Command LoadItemsCommand { get; }
        public Command AddItemCommand { get; }
        public Command<Item> ItemTapped { get; }

        private string _timeS;

        public string TimeS
        {
            get => _timeS;
            set => SetProperty(ref _timeS, value);
        }

        public ItemsViewModel(Page currentPage)
        {
            Title = "Cloks";
            Items = new ObservableCollection<Item>();
            this.currentPage = currentPage;
            LoadItemsCommand = new Command(async () => await ExecuteLoadItemsCommand());
            ItemTapped = new Command<Item>(OnItemSelected);
            AddItemCommand = new Command(OnAddItem);
            alarmService = new AlarmService();
        }

        public async void OnSwitchToggled(object sender, ToggledEventArgs e)
        {
            if (sender is Xamarin.Forms.Switch switchControl)
            {
                if (switchControl.BindingContext is Item selectedItem)
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

        private void SwitchEnabledLogic(Item alarm)
        {
            if (alarm != null)
            {
                alarm.IsEnabled = true;
               // currentPage.DisplayAlert("Switch Status", alarm.IsEnabled.ToString(), "OK");
                alarmService.SetAlarmTimer(alarm);
            }
            else
            {
                currentPage.DisplayAlert("Error", "No alarm selected", "OK");
            }
        }

        private void SwitchDisabledLogic(Item alarm)
        {
            if (alarm != null)
            {
                alarm.IsEnabled = false;
               // currentPage.DisplayAlert("Switch Status", alarm.IsEnabled.ToString(), "OK");
                alarmService.CancelAlarmTimer(alarm);
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
                Items.Clear();
                var items = await DataStore.GetItemsAsync(true);
                foreach (var item in items)
                {
                    Items.Add(item);
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
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

        public Item SelectedItem
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
            await Shell.Current.GoToAsync(nameof(NewItemPage));
        }

        async void OnItemSelected(Item item)
        {
            if (item == null)  
                return;
            await Shell.Current.GoToAsync($"{nameof(ItemDetailPage)}?{nameof(ItemDetailViewModel.ItemId)}={item.Id}");
        }
    }
}