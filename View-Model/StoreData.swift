//
//  StoreModelData.swift
//  ChatRestaurant
//
//  Created by Gbenga Abayomi on 18/04/2023.
//
import SwiftUI
class StoreManager: ObservableObject{
    @Published var stores = [Store]()
    @AppStorage ("stores") var restaurants: String = " "
    @AppStorage ("food") var food: String = " "
    @Published var nameSort = SortBy.nameASC
    @Published var ratingSort = SortBy.ratingASC
    @Published var isLoading = true
//    private let databasecontroller: Databasecontroller
//    @Binding var searchText: String
//    init(){
////        restaurants = self.fetchData()
//        print("init \(self.stores)")
//    }

    init(){
        self.searchRestaurants(for: " ")
    }
    func searchRestaurants(for query: String){
//        var bang: [Store] = []
        if let url=URL(string: "https://api.spoonacular.com/food/restaurants/search?\(query)&apiKey=4a6bd7b86d564f4c990a61044b7375b7"){
            let session=URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let results = try decoder.decode(Stores.self, from: safeData)
                            DispatchQueue.main.async {
                                self.stores = results.restaurants
                                self.isLoading = false
                                print("stores \(self.stores)")
//                                bang.append(contentsOf: self.stores)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }

    
    func sortList(by sortType: SortBy) {
        switch sortType {
        case .nameASC:
            stores.sort {
//            restaurants.sort {
                $0.name.lowercased() < $1.name.lowercased()
            }
        case .nameDESC:
            stores.sort {
                $0.name.lowercased() > $1.name.lowercased()
            }
        case .ratingASC:
            stores.sort {
                $0.rating < $1.rating
            }
        case .ratingDESC:
            stores.sort {
                $0.rating > $1.rating
            }
        }
    }
    
    
    
    
    enum SortBy: String {
        case nameASC = "Name △"
        case nameDESC = "Name ▽"
        case ratingASC = "Rating △"
        case ratingDESC = "Rating ▽"
    }
//    func reload() async {
//           bookmarks = await databaseController.loadAllModels(
//               ofType: Bookmark.self
//           )
}
