using GPSclocker.Models;
using GPSclocker.Services;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

public class GpsMockDataStore : IDataStore<GpsItem>
{
    private readonly string dataFilePath;
    private List<GpsItem> items;

    public GpsMockDataStore()
    {
        dataFilePath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Personal), "GpsItems.json");
        LoadItems();
    }

    private void LoadItems()
    {
        if (File.Exists(dataFilePath))
        {
            var json = File.ReadAllText(dataFilePath);
            items = JsonConvert.DeserializeObject<List<GpsItem>>(json);
        }
        else
        {
            items = new List<GpsItem>();
        }
    }

    private void SaveItems()
    {
        var json = JsonConvert.SerializeObject(items);
        File.WriteAllText(dataFilePath, json);
    }

    public async Task<bool> AddItemAsync(GpsItem item)
    {
        item.OrderIndex = items.Count;
        items.Add(item);
        SaveItems();
        return await Task.FromResult(true);
    }

    public async Task<bool> UpdateItemAsync(GpsItem item)
    {
        var oldItem = items.FirstOrDefault(arg => arg.Id == item.Id);
        items.Remove(oldItem);
        items.Add(item);
        SaveItems();

        return await Task.FromResult(true);
    }

    public async Task<bool> DeleteItemAsync(string id)
    {
        var oldItem = items.FirstOrDefault(arg => arg.Id == id);
        items.Remove(oldItem);
        SaveItems();
        return await Task.FromResult(true);
    }

    public async Task<GpsItem> GetItemAsync(string id)
    {
        return await Task.FromResult(items.FirstOrDefault(s => s.Id == id));
    }

    public async Task<IEnumerable<GpsItem>> GetItemsAsync(bool forceRefresh = false)
    {
        if (forceRefresh)
            LoadItems();

        items.Sort((item1, item2) => item1.OrderIndex.CompareTo(item2.OrderIndex));

        return await Task.FromResult(items);
    }
    public async Task<IEnumerable<GpsItem>> GetActiveItemsAsync()
    {
        return await Task.FromResult(items.Where(item => item.IsEnabled));
    }

}
