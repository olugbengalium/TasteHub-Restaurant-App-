//
//  NewPriceView.swift
//  TasteHub
//
//  Created by Gbenga Abayomi on 21/04/2023.
//

import SwiftUI

struct PriceView: View {
//    var store:Store
    @EnvironmentObject var viewModel: StoreManager
    @Binding var Price: Int
    var body: some View {
        VStack{
            ForEach(viewModel.stores.filter({ $0.price < Price})) {
                store in
                StoreView(store: store)
            }
        }
    }
}
