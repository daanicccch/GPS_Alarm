using GPSclocker.Models;
using GPSclocker.Views;
using Xamarin.Forms;

namespace GPSclocker
{
    public class AlarmActivity : Application
    {

        protected override void OnResume()
        {
            base.OnResume();
            MainPage.Navigation.PushAsync(new GPSitems());
        }
    }
}
