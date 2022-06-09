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
    @StateObject private var fetcher = ProductsFetcher()
    var body: some Scene {
        WindowGroup {
            TabbarView()
                .environmentObject(fetcher)
        }
    }
}


