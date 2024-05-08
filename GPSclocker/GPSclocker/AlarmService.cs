using GPSclocker.Models;
using GPSclocker.ViewModels;
using GPSclocker.Views;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Threading.Tasks;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace GPSclocker
{
    public class AlarmService
    {
        public string TimeS = "234";
        private DateTime alarmDateTime;
        public void SetAlarmTimer(Item alarm)
        {
            alarmDateTime = DateTime.Today.Add(alarm.Time);
          
            if (alarmDateTime <= DateTime.Now)
            {
                alarmDateTime = DateTime.Today.Add(alarm.Time).AddDays(1);
            }

            TimeSpan timeUntilAlarm = alarmDateTime - DateTime.Now;
            Task.Delay(timeUntilAlarm).ContinueWith(task =>
            {
                if (alarm.IsEnabled)
                {
                    Device.BeginInvokeOnMainThread(async () =>
                    {
                        TimeS = alarmDateTime.ToString(@"hh\:mm");
                        WriteTimeSToFile(TimeS);
                        
                        await Shell.Current.GoToAsync($"{nameof(WakeUpPage)}?Item={alarm.Time.ToString(@"hh\:mm")}");

                    });
                }
            });
        }

        private void WriteTimeSToFile(string timeS)
        {
            string fileName = "timeS.txt";
            string folderPath = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal);
            string filePath = Path.Combine(folderPath, fileName);

            // Запись значения TimeS в файл
            using (StreamWriter writer = File.AppendText(filePath))
            {
                writer.WriteLine(timeS);
            }
        }

        public void CancelAlarmTimer(Item alarm)
        {
            alarm.IsEnabled = false;
        }
    }
}
