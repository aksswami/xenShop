//
//  xenShopApp.swift
//  Shared
//
//  Created by Amit Kumar Swami on 9/6/22.
//

import SwiftUI
import Combine

@main
struct xenShopApp: App {
    private var cancellables = Set<AnyCancellable>()
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear {
//                let network = NetworkManager()
//                network.request(target: .products, responseType: [Product].self)
//                    .print()
//                    .sink(receiveCompletion: { completion in
//                        print(completion)
//                    }, receiveValue: { products in
//                        print(products)
//                    })
//                    .store(in: &cancellables)
            }
        }
    }
}


