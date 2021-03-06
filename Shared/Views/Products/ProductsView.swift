//
//  ProductsView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 9/6/22.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var appState: AppState
    @State private var showingFilter = false
    @State private var selectedCategory: String?
    
    private var filtertedProducts: [Product] {
        guard let selectedCategory = selectedCategory else {
            return appState.products
        }
        return appState.products.filter { $0.category == selectedCategory }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVGrid(columns: [
                        GridItem(.fixed((geometry.size.width - 0) / 2.0), spacing: 0, alignment: .leading),
                        GridItem(.fixed((geometry.size.width - 0) / 2.0), spacing: 0, alignment: .leading)
                    ], alignment: .leading, spacing: 20) {
                        ForEach(filtertedProducts, id: \.id) { product in
                            ProductRowView(product: product)
                                .frame(width: geometry.size.width/2.0, height: 255, alignment: .center)
                                .environmentObject(appState)
                        }
                    }
                }
            }
            .navigationTitle(Constant.XenString.appTitle)
            .foregroundColor(XenColor.title)
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: CategoryFilterView())
        }
    }
    
    fileprivate func CategoryFilterView() -> some View {
        Button("Filter") {
            print("Filter")
            showingFilter = true
        }
        .confirmationDialog("Select a category",
                            isPresented: $showingFilter,
                            titleVisibility: .visible) {
            ForEach(appState.categories, id: \.self) { category in
                Button(category.capitalized) {
                    selectedCategory = category
                }
            }
            Button("Clear", role: .cancel) {
                selectedCategory = nil
            }
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
