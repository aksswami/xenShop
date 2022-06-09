//
//  ProductRowView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 9/6/22.
//

import SwiftUI

struct ProductRowView: View {
    var product: Product
    @State var show = false
    
    var body: some View {
        ZStack {
            //            NavigationLink(destination: ItemDetailsView(show: self.$show, cloth: cloth), isActive: self.$show) {
            //                Text("")
            //            }
            VStack(alignment: .leading) {
                Image("ProductA")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width / 2, height: 190)
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .cornerRadius(0)
                
                Text(product.title)
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .foregroundColor(XenColor.secondaryBlack)
                    .padding([.horizontal], 10)
                Text(product.category)
                    .font(.caption)
                    .foregroundColor(XenColor.secondaryBlack)
                    .padding([.horizontal], 10)
                HStack {
                    Text("S$\(product.price)")
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .foregroundColor(XenColor.primaryBlack)
                }
                .padding([.leading, .trailing], 10)
                Spacer()
            }
//            .frame(width: 170, height: 255)
            .background(Color.clear)
            .clipped()
            .onTapGesture {
                self.show.toggle()
            }
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(id: 1,
                              title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                              price: 109.95,
                              description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                              category: "men's clothing",
                              image: URL(string: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")!,
                              rating: Product.Rating(rate: 3.9, count: 120))
        ProductRowView(product: product)
    }
}
