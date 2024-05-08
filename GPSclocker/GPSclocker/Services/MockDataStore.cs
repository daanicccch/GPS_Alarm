using GPSclocker.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace GPSclocker.Services
{
    public class MockDataStore : IDataStore<Item>
    {
        private readonly string dataFilePath;
        private List<Item> items;

        public MockDataStore()
        {
            dataFilePath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Personal), "items.json");
            LoadItems();
        }

        private void LoadItems()
        {
            if (File.Exists(dataFilePath))
            {
                var json = File.ReadAllText(dataFilePath);
                items = JsonConvert.DeserializeObject<List<Item>>(json);
            }
            else
            {
                items = new List<Item>();
            }
        }

        private void SaveItems()
        {
            var json = JsonConvert.SerializeObject(items);
            File.WriteAllText(dataFilePath, json);
        }


        public async Task<bool> AddItemAsync(Item item)
        {
            item.OrderIndex = items.Count;
            items.Add(item);
            items.Sort((item1, item2) => item1.Time.CompareTo(item2.Time));
            SaveItems();
            return await Task.FromResult(true);
        }

        public async Task<bool> UpdateItemAsync(Item item)
        {
            var oldItem = items.FirstOrDefault(arg => arg.Id == item.Id);
            if (oldItem != null)
            {
                items.Remove(oldItem);
                items.Add(item);
                SaveItems();
            }
            return await Task.FromResult(true);
        }

        public async Task<bool> DeleteItemAsync(string id)
        {
            var oldItem = items.FirstOrDefault(arg => arg.Id == id);
            if (oldItem != null)
            {
                items.Remove(oldItem);
                SaveItems();
            }
            return await Task.FromResult(true);
        }

        public async Task<Item> GetItemAsync(string id)
        {
            return await Task.FromResult(items.FirstOrDefault(s => s.Id == id));
        }

        public async Task<IEnumerable<Item>> GetItemsAsync(bool forceRefresh = false)
        {
            if (forceRefresh)
                LoadItems();
            items.Sort((item1, item2) =>
            {
                int orderByOrderIndex = item1.OrderIndex.CompareTo(item2.OrderIndex);
                if (orderByOrderIndex == 0)
                {
                    return item1.Time.CompareTo(item2.Time);
                }
                return orderByOrderIndex;
            });
            return await Task.FromResult(items);
        }

        public async Task<IEnumerable<Item>> GetActiveItemsAsync()
        {
            return await Task.FromResult(items.Where(item => item.IsEnabled));
        }
    }
}
