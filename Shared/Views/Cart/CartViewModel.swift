//
//  CartViewModel.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import Foundation
import Combine

class CartViewModel: ObservableObject {
    @Published var cart: Cart
    
    
    init() {
        cart = Cart(id: 1, userId: 1, date: Date.now)
    }
    
    
    func addProductToCart(product: Product) {
        if let index = cart.products.firstIndex(where: { $0.productId == product.id }) {
            cart.products[index].quantity += 1
        } else {
            cart.products.append(Cart.CartItem(productId: product.id, quantity: 1))
        }
        self.cart = cart
        print(cart)
        objectWillChange.send()
    }
    
    
}
