//
//  ProductsView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 9/6/22.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var fetcher: ProductsFetcher
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVGrid(columns: [
                        GridItem(.fixed((geometry.size.width - 0) / 2.0), spacing: 0, alignment: .leading),
                        GridItem(.fixed((geometry.size.width - 0) / 2.0), spacing: 0, alignment: .leading)
                    ], alignment: .leading, spacing: 0) {
                        ForEach(fetcher.products, id: \.id) { product in
                            ProductRowView(product: product)
                                .frame(width: geometry.size.width/2.0, height: 255, alignment: .center)
                        }
                    }
                }
            }
            .navigationBarTitle("xenShop")
            .navigationBarItems(trailing:
                            Button(action: {
                                print("Edit button pressed...")
                            }) {
                                Text("Filter")
                            }
                        )
            .task {
                fetcher.fetchData()
            }
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
