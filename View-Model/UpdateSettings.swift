//
//  UpdateSettings.swift
//  TasteHub
//
//  Created by Gbenga Abayomi on 21/04/2023.
//
import SwiftUI

class UserSettings: ObservableObject {
    @AppStorage("user") var userData: Data?
    @Published var user: User
    var defaultadata:String = "favorite"
    
//    init() {
//        self.user = User(name: "", email: "", favoriteRestaurants: [])
//        if let userData = userData,
//           let user = try? JSONDecoder().decode(User.self, from: userData) {
//            self.user = user
//        }
//
//    }
//
    init() {
        print("UserSettings init called")
        self.user = User(name: "", email: "", favoriteRestaurants: [])
        if let userData = userData,
           let user = try? JSONDecoder().decode(User.self, from: userData) {
            self.user = user
        }
    }
    
//    func saveUser() {
//        if let encoded = try? JSONEncoder().encode(user) {
//            userData = encoded
//
//        }
//    }
    func saveUser() {
        if let encodeData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodeData, forKey: defaultadata)
            print("ElNo")
        }
    }
}

