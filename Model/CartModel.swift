//
//  CartModel.swift
//  TasteHub
//
//  Created by Gbenga Abayomi on 21/04/2023.
//


import SwiftUI
class Cart: ObservableObject {
    var id = UUID()
    @EnvironmentObject var viewModel:StoreManager
    @Published var items = [Store]()
    @Published var total: Int = 0
    
    func addItem(_ store: Store) {
        items.append(store)
        total += store.price
    }
}
