//
//  ProductsFetcher.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import Foundation
import Combine

class ProductsFetcher: ObservableObject {
    @Published var products = [Product]()
    let network = NetworkManager()
    private var cancellables = Set<AnyCancellable>()    
     func fetchData() {
         network.request(target: .products, responseType: [Product].self)
             .sink { completion in
                 print(completion)
             } receiveValue: { products in
                 self.products = products
             }
             .store(in: &cancellables)
    }
}
