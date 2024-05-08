using System;
using System.Threading.Tasks;
using Xamarin.Forms;
using GPSclocker.Models;
using GPSclocker.Views;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using GPSclocker.Services;

namespace GPSclocker.ViewModels
{
    public class WakeUpPageModel : BaseViewModel
    {
        private string itemId;
        private string adress;
        private string description;
        private Label Timee;
        AlarmService alarmService;
        public WakeUpPageModel(Label Timee)
        {
            this.Timee = Timee;
            alarmService = new AlarmService();
            ReadTimeS();
            StartAlarm();
        }

        public string Id { get; set; }
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
        private void ReadTimeS()
        {
            string fileName = "timeS.txt";
            string folderPath = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal);
            string filePath = Path.Combine(folderPath, fileName);

            try
            {
                if (File.Exists(filePath))
                {
                    using (StreamReader reader = new StreamReader(filePath))
                    {
                        string timeS = reader.ReadToEnd();
                        Timee.Text = timeS;
                        File.Delete(filePath);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error reading timeS file: " + ex.Message);
            }
        }

        public void StartAlarm()
        {

            var assembly = Assembly.GetExecutingAssembly();
            using (var stream = assembly.GetManifestResourceStream("GPSclocker.Views.Resources.signal.mp3"))
            {
                var player = Plugin.SimpleAudioPlayer.CrossSimpleAudioPlayer.Current;
                player.Load(stream);
                player.Play();
            }

        }


        public async void StopAlarm()
        {
            var player = Plugin.SimpleAudioPlayer.CrossSimpleAudioPlayer.Current;
            player.Stop();
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
                Id = item.Id;
                Description = item.Description;
            }
            catch (Exception)
            {
                Debug.WriteLine("Failed to Load Item");
            }
        }

    }
}
