//
//  StoreView.swift
//  TasteHub
//
//  Created by Gbenga Abayomi on 21/04/2023.
//
import SwiftUI

struct StoreView: View {
    let store: Store
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var viewModel: StoreManager
    @State private var isButton1Selected = false
    @State private var isButton2Selected = false
    @EnvironmentObject var userSettings: UserSettings
    @State private var showingDetail = false
    var body: some View {
        ScrollView{
            Button(action: {
                self.showingDetail.toggle()
        
            }) {
                AsyncImage(url: URL(string: store.foodImage)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width-50, height: 200)
                        .clipped()
                }
            placeholder: {
                ProgressView()
                    .frame(width: UIScreen.main.bounds.width-50, height: 200)
            }.sheet(isPresented: $showingDetail) {
                ScrollView {
                    VStack{
                        Text("\(store.description)")
                            .foregroundColor(.orange)
                            .background(Color(.red))
                            .fontWeight(.bold)
                        HStack{
                            Text("£\(store.price)")
                                .foregroundColor(.green)
                                .fontWeight(.bold)
                            Button("add to cart") {
                                if cart.items.firstIndex(of: store) == nil {
                                    cart.addItem(store)
                                }
                                isButton1Selected.toggle()
                            }.buttonStyle(MyButtonStyle(isSelected: isButton1Selected))
                        }
                    }
                }.padding()
            }
        }
            
            HStack {
                Text(store.name)
                    .font(.title)
                    .bold()
                
            }
            HStack{
                Text("$\(store.price)")
                    .font(.headline)
                    .padding(.horizontal, 10)
                Spacer()
                
                HStack(spacing: 0) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.2f",store.rating))
                        .padding(.trailing)
                        .font(.headline)
                }
                .padding(.bottom, 1)
                
            }
            .padding(.bottom)
            HStack{
                
                Button("add to cart") {
                    if cart.items.firstIndex(of: store) == nil {
                        cart.addItem(store)
                    }
                    isButton1Selected.toggle()
                }
                                .buttonStyle(MyButtonStyle(isSelected: isButton1Selected))
                Spacer()
                Button("add to favorites") {
                    if userSettings.user.favoriteRestaurants.firstIndex(of: store) == nil{
                        
                        userSettings.user.favoriteRestaurants.append(store)
                        userSettings.saveUser()
                        
                        isButton2Selected.toggle()
                    }
                }
                .buttonStyle(MyButtonStyle(isSelected: isButton2Selected))
            }
        }
        .padding()
        
        .environmentObject(cart)
        .environmentObject(userSettings)
        .environmentObject(viewModel)
        .frame(width: UIScreen.main.bounds.width-50)
    }
    }
