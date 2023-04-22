//
//  StoreModel.swift
//  ChatRestaurant
//
//  Created by Gbenga Abayomi on 18/04/2023.
//

import Foundation

struct Stores: Codable,Hashable{
    var restaurants:[Store]
}
struct Store: Codable,Hashable, Identifiable{
    var id: UUID{
        return UUID()
    }
    var _id: String
    var inCart: Bool?
    
    var description: String
    var aggregated_rating_count: Int?
    var price: Int{
        if aggregated_rating_count != nil{
            return aggregated_rating_count!
        }else {return 340}
    }
    var food_photos: [String]
    var foodImage: String{
        return food_photos.first ?? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.foodnetwork.com%2Frecipes%2Fina-garten%2Fperfect-roast-turkey-recipe4-1943576&psig=AOvVaw3RSDbu9AwAmQbAxfZ1ZINt&ust=1682136221105000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCKD7wfGLuv4CFQAAAAAdAAAAABAE"
    }
    var name: String
    var rating: Double{
        if weighted_rating_value != nil{
            return weighted_rating_value!
        }else {return 340}
    }
    var weighted_rating_value: Double?
    var logo_photos: [String]
    var image: URL{
        return URL(string: logo_photos.first ?? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.foodnetwork.com%2Frecipes%2Fina-garten%2Fperfect-roast-turkey-recipe4-1943576&psig=AOvVaw3RSDbu9AwAmQbAxfZ1ZINt&ust=1682136221105000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCKD7wfGLuv4CFQAAAAAdAAAAABAE")!
    }
    var isFavorite: Bool?
}

