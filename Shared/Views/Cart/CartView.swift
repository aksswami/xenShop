//
//  CartView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import SwiftUI

struct CartView: View {
    @State var cart: Cart
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ZStack(alignment: .top) {
                        VStack {
                            ScrollView(.vertical, showsIndicators: false, content: {
                                VStack(spacing: 10) {
                                    ForEach(cart.products, id: \.productId) { cartItem in
                                        CartItemView(cartItem: cartItem)
                                    }
                                }
                                .padding(.horizontal, 15)
                            })
                            .disabled(false)
                            .frame(height: (CGFloat(cart.products.count) * 120) + 30)
                            LineView()
                            VStack {
                                HStack {
                                    Text("Item Total")
                                        .font(.system(size: 14, weight: .regular, design: .default))
                                        .foregroundColor(XenColor.primaryText)
                                    Spacer()
                                    Text("S$1222")
                                        .font(.system(size: 14, weight: .bold, design: .default))
                                        .foregroundColor(XenColor.primaryText)
                                }
                                .padding(.top, 10)
                                .padding(.horizontal, 15)
                                
                                LineView()
                                    .padding(.vertical, 5)
                                
                                HStack {
                                    Text("Total Amount")
                                        .font(.system(size: 16, weight: .bold, design: .default))
                                        .foregroundColor(XenColor.primaryText)
                                    Spacer()
                                    Text("S$2323")
                                        .font(.system(size: 16, weight: .bold, design: .default))
                                        .foregroundColor(XenColor.primaryText)
                                }
                                .padding(.horizontal, 15)
                                .padding(.bottom, 5)
                                
                                Spacer()
                            }
                            .padding(.top, 2)
                        }
                    }
                }
                .padding(.top, 5)
                Spacer()
                //CheckoutView
            }
            .navigationTitle(Constant.XenString.cart)
            .foregroundColor(XenColor.primaryText)
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        let Cart = Cart(id: 1, userId: 1, date: Date.now, products: [])
        CartView(cart: Cart)
    }
}
