//
//  Product.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 9/6/22.
//

import Foundation

struct Product: Codable {
    /**
     {
         "id": 1,
         "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
         "price": 109.95,
         "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
         "category": "men's clothing",
         "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
         "rating": {
             "rate": 3.9,
             "count": 120
         }
     }
     */
    
    var id: Int
    var title: String
    var price: Double
    var description: String?
    var category: String
    var image: URL?
    var rating: Rating
    
    
    struct Rating: Codable {
        var rate: Float
        var count: Int
    }
}
