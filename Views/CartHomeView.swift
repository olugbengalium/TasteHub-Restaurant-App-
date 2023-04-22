//
//  CartHomeView.swift
//  TasteHub
//
//  Created by Gbenga Abayomi on 21/04/2023.
//


import SwiftUI

struct CartHomeView: View {
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        VStack {
            List {
                ForEach(cart.items) { food in
                    HStack {
                        Text(food.name)
                        Spacer()
                        Text("\(food.price) USD")
                        Button(action: {cart.total -= food.price}, label: {
                            RemoveButton(item: cart)
                        })
//                        .foregroundColor(.green)
                         // pass the food item as `item`
                    }
                }
            }
            Text("Total: \(cart.total) USD")
            Button("Checkout") {
                print("you paid £\(cart.total)")
                let allIndexes = IndexSet(integersIn: 0..<cart.items.count)
                // Remove all the items from the cart
                cart.items.remove(atOffsets: allIndexes)
                // Handle checkout logic here
            }
        }
    }
    
    struct RemoveButton: View {
        @EnvironmentObject var cart: Cart
        @State private var isTapped = false
        let item: Cart // change `store` to `item`
        var body: some View {
            Button(isTapped ? "paid" : "pay") {
                // Call the function to remove the item from the cart
                removeItem(item) // pass the item to the function
                isTapped = true
            }
            .foregroundColor(isTapped ? .gray : .red)
        }
        
        func removeItem(_ item: Cart) {
            if let index = cart.items.firstIndex(where: { $0.id == item.id }) {
                cart.items.remove(at: index)
            }
        }
    }
}
