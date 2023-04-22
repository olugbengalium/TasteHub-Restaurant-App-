//
//  TabsPageView.swift
//  TasteHub
//
//  Created by Gbenga Abayomi on 21/04/2023.
//

import SwiftUI
import SwiftUI

struct TabspageView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Stores", systemImage: "building.2")
                }
            CartHomeView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill.badge.plus")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "network")
                }
        }
        
        .environmentObject(Cart())
        .environmentObject(UserSettings())
        .environmentObject(StoreManager())
    }
}
