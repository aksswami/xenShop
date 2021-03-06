//
//  Cart.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 9/6/22.
//

import Foundation

struct Cart: Codable {

    /**
     {
         "id": 1,
         "userId": 1,
         "date": "2020-03-02T00:00:02.000Z",
         "products": [{
             "productId": 1,
             "quantity": 4
         }, {
             "productId": 2,
             "quantity": 1
         }, {
             "productId": 3,
             "quantity": 6
         }],
         "__v": 0
     }
     */
    
    var id: Int
    var userId: Int
    var date: Date
    var products = [CartItem]()
    
    struct CartItem: Codable {
        var productId: Int
        var quantity: Int
    }
    
//    internal init(id: Int, userId: Int, date: Date, products: [Cart.CartItem] = [CartItem]()) {
//        self.id = id
//        self.userId = userId
//        self.date = date
//        self.products = products
//    }
}
