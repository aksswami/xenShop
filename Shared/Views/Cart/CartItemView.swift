//
//  CartItemView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import SwiftUI

struct CartItemView: View {
    @State var cartItem: Cart.CartItem
    @EnvironmentObject var appState: AppState
    var product: Product? {
        return appState.products.first { $0.id == cartItem.productId }
    }
    var body: some View {
        if let product = product {
            ZStack() {
                HStack(alignment: .top) {
                    XenImageView(url: product.image)
                        .frame(width: 120, height: 120, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Text(product.title)
                                .font(.system(size: 15, weight: .semibold, design: .default))
                                .foregroundColor(XenColor.primaryText)
                                .lineLimit(1)
                            Spacer()
                            Button(action: {
                                
                            }) {
                                Image(systemName: "xmark.square")
                                    .foregroundColor(Color.red.opacity(0.6))
                                    .padding(.top, 0)
                            }
                        }
                        
                        Text(product.category)
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .foregroundColor(XenColor.secondaryText)
                            .padding(.top, -5)
                        
                        Spacer()
                        HStack {
                            HStack {
                                Button(action: {}) {
                                    Image(systemName: "minus")
                                        .foregroundColor(.gray)
                                        .frame(width: 25, height: 25)
                                }
                                Text("\(cartItem.quantity)")
                                    .font(.system(size: 13, weight: .bold, design: .default))
                                    .foregroundColor(XenColor.primary)
                                    .padding(.horizontal, 5)
                                Button(action: {}) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.gray)
                                        .frame(width: 25, height: 25)
                                }
                            }
                            .background(XenColor.secondaryBackground)
                            .cornerRadius(5)
                            .padding(.bottom, 10)
                            Spacer()
                            Text(product.presentablePrice)
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .foregroundColor(XenColor.primaryText)
                        }
                        
                    }
                    .padding(.init(top: 5, leading: 5, bottom: 5, trailing: 0))
                    Spacer()
                }
                .frame(height: 130)
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        } else {
            Text("Failed to get product")
        }
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        let cartItem = Cart.CartItem(productId: 2, quantity: 2)
        CartItemView(cartItem: cartItem)
    }
}
