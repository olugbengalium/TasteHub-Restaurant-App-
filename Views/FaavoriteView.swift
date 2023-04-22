//
//  FaavoriteView.swift
//  TasteHub
//
//  Created by Gbenga Abayomi on 21/04/2023.
//
//



import SwiftUI
struct FavoritesView: View {
    @EnvironmentObject private var userSettings: UserSettings
    @EnvironmentObject var viewModel: StoreManager

//    @ObservedObject var favoritesStore: FavoritesStore = .standard

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Button("Clear All") {
                        userSettings.user.favoriteRestaurants.removeAll()
                    }
                    .foregroundColor(.red)
                    .padding(.trailing)
                }
                List {
                    ForEach(userSettings.user.favoriteRestaurants) { favorite in
                        HStack{
                            Text("\(favorite.name)")
                            Text("£\(favorite.price)")
                        }
                        
                    }
                    .onDelete(perform: removeFavorite(at:))
                }
                .navigationTitle("My Favorites")
            }
        }
        .environmentObject(userSettings)
        .environmentObject(viewModel)
    }
    func removeFavorite(at offsets: IndexSet) {
        userSettings.user.favoriteRestaurants.remove(atOffsets: offsets)
        
    }
}

