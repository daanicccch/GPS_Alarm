using GPSclocker.Models;
using GPSclocker.ViewModels;
using GPSclocker.Views;
using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;


namespace GPSclocker.Views
{

    public partial class ItemsPage : ContentPage
    {
        ItemsViewModel _viewModel;
        public ItemsPage()
        {
            InitializeComponent();
            BindingContext = _viewModel = new ItemsViewModel(this);

        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            _viewModel.OnAppearing();
        }

        private void switchAlarm_Toggled(object sender, ToggledEventArgs e)
        {
            _viewModel.OnSwitchToggled(sender, e);
        }
    }
}
