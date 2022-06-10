//
//  AppState.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import Foundation
import Combine

let userId = 1
class AppState: ObservableObject {
    @Published var products = [Product]()
    @Published var categories = [String]()
    @Published var cart: Cart = Cart(id: Int.random(in: 1...Int.max), userId: userId, date: Date.now, products: [Cart.CartItem(productId: 2, quantity: 2)])
    
    let network = NetworkManager()
    private var cancellables = Set<AnyCancellable>()
    func fetchProducts() {
        network.request(target: .products, responseType: [Product].self)
            .sink { completion in
                print(completion)
            } receiveValue: { products in
                self.products = products
            }
            .store(in: &cancellables)
    }
    
    func fetchCategories() {
        network.request(target: .categories, responseType: [String].self)
            .sink { completion in
                print(completion)
            } receiveValue: { categories in
                self.categories = categories
            }
            .store(in: &cancellables)
    }
    
    func fetchCart() {
        network.request(target: .cart(userId: userId), responseType: Cart.self)
            .sink { completion in
                print(completion)
            } receiveValue: { cart in
                self.cart = cart
            }
            .store(in: &cancellables)
    }
}
