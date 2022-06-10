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
    @Published var cartViewModel = CartViewModel()
    
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
                self.cartViewModel.cart = cart
                self.cartViewModel.objectWillChange.send()
            }
            .store(in: &cancellables)
    }

}
