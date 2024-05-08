using GPSclocker.Models;
using GPSclocker.Services;
using GPSclocker.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace GPSclocker.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class GPSitems : ContentPage
    {
        GpsItemsViewModel _viewModel;

        public GPSitems()
        {
            InitializeComponent();

            BindingContext = _viewModel = new GpsItemsViewModel(this);
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