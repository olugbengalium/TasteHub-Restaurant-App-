//
//  User_Model.swift
//  TasteHub
//
//  Created by Gbenga Abayomi on 21/04/2023.
//

import Foundation
struct User: Codable {
    var name: String
    var email: String
    var favoriteRestaurants: [Store]
}
