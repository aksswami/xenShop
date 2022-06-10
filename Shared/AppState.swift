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
    @Published var cartViewModel = CartViewModel(cart: Cart(id: Int.random(in: 1...Int.max), userId: 1, date: Date.now), products: [])
    
    let network = NetworkManager()
    private var cancellables = Set<AnyCancellable>()
    
    internal init() {
        $products.sink { [weak self] products in
            guard let cart = self?.cartViewModel.cart else { return }
            self?.cartViewModel = CartViewModel(cart: cart, products: products)
        }
        .store(in: &cancellables)
    }
    
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
                self.cartViewModel.cart = cart
                self.cartViewModel.objectWillChange.send()
            }
            .store(in: &cancellables)
    }

}
