using Android.App;
using Android.Content;
using Android.OS;
using Android.Widget;
using Xamarin.Forms.Platform.Android;
using Android.Support.V7.App;
using GPSclocker.Views;

namespace GPSclocker.Droid
{
    [Activity(Label = "GpsWakeUpActivity")]
    public class GpsWakeUpActivity : global::Xamarin.Forms.Platform.Android.FormsAppCompatActivity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Инициализация платформы Xamarin.Forms
            Xamarin.Forms.Forms.Init(this, savedInstanceState);

            // Создание экземпляра страницы GpsWakeUpPage
            var page = new GPSitems();

            // Установка MainPage в приложении Xamarin.Forms
            Xamarin.Forms.Application.Current.MainPage = page;

            // Загрузка содержимого страницы
            LoadApplication(new App());
        }
    }
}
