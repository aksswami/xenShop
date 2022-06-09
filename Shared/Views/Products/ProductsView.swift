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
        
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(columns: [
                GridItem(.fixed((geometry.size.width - 42) / 2.0), spacing: 10, alignment: .center),
                GridItem(.fixed((geometry.size.width - 42) / 2.0), spacing: 10, alignment: .center)
            ], alignment: .leading, spacing: 10) {
                ForEach(fetcher.products, id: \.id) { product in
                    ProductRowView(product: product)
                }
            }.padding(EdgeInsets(top: 0, leading: 16.0, bottom: 0, trailing: 16.0))
            }
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
