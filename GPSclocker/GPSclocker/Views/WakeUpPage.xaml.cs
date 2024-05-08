using GPSclocker.Models;
using GPSclocker.Services;
using Xamarin.Forms.Xaml;
using Xamarin.Forms;
using Prism.Navigation;
using GPSclocker.ViewModels;
using System;
using System.IO;
using Xamarin.Forms.PlatformConfiguration;
using System.Reflection;


namespace GPSclocker.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class WakeUpPage : ContentPage
    {
        WakeUpPageModel viewModel;
        public WakeUpPage()
        {
            InitializeComponent();
            viewModel = new WakeUpPageModel(Timee);
            BindingContext = viewModel;
        }

        private void Alarm_OFF(object sender, EventArgs e)
        {
            viewModel.StopAlarm();

        }

    }
}
