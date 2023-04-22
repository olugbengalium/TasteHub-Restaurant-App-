//
//  HomeView.swift
//  TasteHub
//
//  Created by Gbenga Abayomi on 21/04/2023.
//

import SwiftUI
struct HomeView: View {
    @EnvironmentObject var viewModel: StoreManager
//    @State private var cartItems = [CartItem]()
//    let userSettings = UserSettings()
//    @EnvironmentObject var userSettings: UserSettings
    @EnvironmentObject var userSettings: UserSettings
    @State var totalCarts: [Store] = [Store]()
    @State private var searchQuery = ""
    @State var showingDetail = false

    
    @State var paid = false
    @EnvironmentObject var cart: Cart
    @State var newprice = false
//    @State var newStore: [Store] = StoreManager().stores
    @State var selectedPrice = 0
//    @ObservedObject var user = User(name: "ade", email: "yemi")
    var body: some View {
        NavigationStack {
            Button(action: {viewModel.sortList(by: .nameASC)}) {
                Text("shuffle by name")
            }
            ScrollView{
            
            
            TextField("Search for food", text: $searchQuery, onCommit: {
                viewModel.searchRestaurants(for: searchQuery)
            })                .textFieldStyle(RoundedBorderTextFieldStyle())
            //                    .padding()
            
                .padding(5)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .shadow(radius: 3)
            TextField("Enter Price",
                      text: Binding(
                        get: { String(selectedPrice) },
                        set: { selectedPrice = Int(Int64($0.filter{ "0123456789".contains($0)}) ?? 0) }
                      )
            ).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(5)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .shadow(radius: 3)
                
                Button(action: {self.showingDetail.toggle()}) {
                    Text("Click to shuffle stores based on your budget")
                        .font(.headline)
                }.sheet(isPresented: $showingDetail) {
                    ScrollView {
                        PriceView(Price: $selectedPrice)
                    }.padding()
                }
            
            
            
//            NavigationLink(destination: PriceView(Price: $selectedPrice)){
//
//                Text("Click to shuffle stores based on your budget")
//                    .font(.headline)
//            }
                Group{
                    if viewModel.isLoading {
                        ProgressView()
                            .padding(30)
                    } else {
                        
                        
                        
                        ForEach(viewModel.stores){ store in
                            StoreView(store: store)

                        }
                    }
                    
                    Text("Cart Price: \(cart.total) ")
                    
                }

            //                .navigationtitle("Restaurant")
        }}
        .environmentObject(viewModel)
        .environmentObject(cart)
        .environmentObject(userSettings)
        }
    }
