//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

[assembly: global::Xamarin.Forms.Xaml.XamlResourceIdAttribute("GPSclocker.Views.GpsWakeUpPage.xaml", "Views/GpsWakeUpPage.xaml", typeof(global::GPSclocker.Views.GpsWakeUpPage))]

namespace GPSclocker.Views {
    
    
    [global::Xamarin.Forms.Xaml.XamlFilePathAttribute("Views\\GpsWakeUpPage.xaml")]
    public partial class GpsWakeUpPage : global::Xamarin.Forms.ContentPage {
        
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Xamarin.Forms.Build.Tasks.XamlG", "2.0.0.0")]
        public global::Xamarin.Forms.Label Gps;
        
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Xamarin.Forms.Build.Tasks.XamlG", "2.0.0.0")]
        private global::Xamarin.Forms.GoogleMaps.Map map;
        
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Xamarin.Forms.Build.Tasks.XamlG", "2.0.0.0")]
        public global::Xamarin.Forms.Label Desription;
        
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Xamarin.Forms.Build.Tasks.XamlG", "2.0.0.0")]
        private void InitializeComponent() {
            global::Xamarin.Forms.Xaml.Extensions.LoadFromXaml(this, typeof(GpsWakeUpPage));
            Gps = global::Xamarin.Forms.NameScopeExtensions.FindByName<global::Xamarin.Forms.Label>(this, "Gps");
            map = global::Xamarin.Forms.NameScopeExtensions.FindByName<global::Xamarin.Forms.GoogleMaps.Map>(this, "map");
            Desription = global::Xamarin.Forms.NameScopeExtensions.FindByName<global::Xamarin.Forms.Label>(this, "Desription");
        }
    }
}
