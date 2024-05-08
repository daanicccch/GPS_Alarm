using Newtonsoft.Json;
using System;

namespace GPSclocker.Models
{
    public class Item
    {
        public string Id { get; set; }
        public TimeSpan Time { get; set; }
        public string Description { get; set; }
        public bool IsEnabled { get; set; }
        [JsonIgnore]
        public int OrderIndex { get; set; }
    }
}