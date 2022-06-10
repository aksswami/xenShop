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
    @Published var products = [Product]()
    
    var orderTotal: Double {
        return cart.products
            .compactMap { item -> (product: Product, quantity: Int)? in
                if let product = products.first(where: { $0.id == item.productId }) {
                    return (product, item.quantity)
                } else {
                    return nil
                }
            }
            .reduce(0) { partialResult, item in
                return partialResult + item.product.price * Double(item.quantity)
            }
    }
    
    var totalItems: Int {
        return cart.products.reduce(0, { $0+$1.quantity })
    }
    
    var orderTotalPrice: String {
        return String(format: "S$%.2f", orderTotal)
    }
    
    init(cart: Cart, products: [Product]) {
        self.cart = cart
        self.products = products
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
