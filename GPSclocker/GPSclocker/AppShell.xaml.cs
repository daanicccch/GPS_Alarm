﻿using GPSclocker.ViewModels;
using GPSclocker.Views;
using System;
using System.Collections.Generic;
using Xamarin.Forms;

namespace GPSclocker
{
    public partial class AppShell : Xamarin.Forms.Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute(nameof(ItemDetailPage), typeof(ItemDetailPage));
            Routing.RegisterRoute(nameof(GpsItemDetailPage), typeof(GpsItemDetailPage));
            Routing.RegisterRoute(nameof(NewItemPage), typeof(NewItemPage));
            Routing.RegisterRoute(nameof(GpsNewItemPage), typeof(GpsNewItemPage));
            Routing.RegisterRoute(nameof(WakeUpPage), typeof(WakeUpPage));
            Routing.RegisterRoute(nameof(GpsWakeUpPage), typeof(GpsWakeUpPage));
        }

    }
}