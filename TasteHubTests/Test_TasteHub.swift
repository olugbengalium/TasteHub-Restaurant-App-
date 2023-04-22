//
//  Test_TasteHub.swift
//  TasteHubTests
//
//  Created by Gbenga Abayomi on 22/04/2023.
//

import XCTest
@testable import TasteHub

final class Test_TasteHub: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testStoreProperties() {
        let store = Store(
//
            _id: "123",
            inCart: true,
            description: "Test description",
            aggregated_rating_count: 10,
            food_photos: ["https://example.com/food.jpg"],
            name: "Test store",
            weighted_rating_value: 4.5,
            logo_photos: ["https://example.com/logo.jpg"],
            isFavorite: true
        )

        XCTAssertEqual(store.id, store.id)
        XCTAssertEqual(store._id, "123")
        XCTAssertEqual(store.inCart, true)
        XCTAssertEqual(store.description, "Test description")
        XCTAssertEqual(store.aggregated_rating_count, 10)
        XCTAssertEqual(store.food_photos, ["https://www.goal.com/food.jpg"])
        XCTAssertEqual(store.name, "Test store")
        XCTAssertEqual(store.weighted_rating_value, 4.5)
        XCTAssertEqual(store.rating, 4.5)
        XCTAssertEqual(store.logo_photos, ["https://example.com/logo.jpg"])
    }

}
//import SwiftUI
//import XCTest
//
//
//class StoreTests: XCTestCase {
//
//}
