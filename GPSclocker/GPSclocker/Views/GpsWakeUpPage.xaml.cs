using GPSclocker.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.GoogleMaps;
using Xamarin.Essentials;
using Xamarin.Forms.Xaml;

namespace GPSclocker.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class GpsWakeUpPage : ContentPage
    {
        GpsWakeUpPageViewModel viewModel;
        public GpsWakeUpPage()
        {
            InitializeComponent();
            viewModel = new GpsWakeUpPageViewModel(map, this);
            viewModel.StartAlarm();
            BindingContext = viewModel;
        }

        private void OFF_Button(object sender, EventArgs e)
        {
            viewModel.offButton();
        }
    }
}