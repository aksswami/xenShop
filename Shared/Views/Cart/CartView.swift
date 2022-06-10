//
//  CartView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import SwiftUI
import Combine

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel
    @State var showOverlay = false
    
    var cart: Cart {
        return cartViewModel.cart
    }
    
    var body: some View {
        NavigationView {
            if cart.products.count == 0 {
                VStack {
                    Image(systemName: "bag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(XenColor.primaryBackground)
                        .frame(width: 100, height: 100, alignment: .center)
                    Text("No products in Cart.\nShop now and add products to cart")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    
                }
                .navigationTitle(Constant.XenString.cart)
                .foregroundColor(XenColor.primaryText)
                .navigationBarTitleDisplayMode(.large)
            } else {
                VStack {
                    ScrollView {
                        ZStack(alignment: .top) {
                            VStack {
                                ScrollView(.vertical, showsIndicators: false, content: {
                                    VStack(spacing: 10) {
                                        ForEach(cart.products, id: \.productId) { cartItem in
                                            CartItemView(cartViewModel: cartViewModel, cartItemId: cartItem.productId)
                                        }
                                    }
                                    .padding(.horizontal, 15)
                                })
                                .disabled(false)
                                .frame(height: (CGFloat(cart.products.count) * 120) + 30)
                            }
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .padding(.top, 5)
                    LineView()
                    VStack {
                        HStack {
                            Text("Total Items")
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .foregroundColor(XenColor.primaryText)
                            Spacer()
                            Text("\(cartViewModel.totalItems)")
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .foregroundColor(XenColor.primaryText)
                        }
                        .padding(.horizontal, 15)
                        
                        LineView()

                        HStack {
                            Text("Total Amount")
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .foregroundColor(XenColor.primaryText)
                            Spacer()
                            Text(cartViewModel.orderTotalPrice)
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .foregroundColor(XenColor.primaryText)
                        }
                        .padding(.horizontal, 15)
                    }
                    .padding(.top, 2)
                    
                    CheckoutButton()
                }
                .overlay(overlayView: Banner(data: Banner.BannerDataModel(title: "Cart Updated", detail: "Item removed from cart.", type: .info), show: $showOverlay), show: $showOverlay)
                .navigationTitle(Constant.XenString.cart)
                .foregroundColor(XenColor.primaryText)
                .navigationBarTitleDisplayMode(.large)
                // Check issue why this varibale change on add.
//                .onReceive(cartViewModel.$itemRemoved) { out in
//                    print("Overlay change \(out)")
//                    self.showOverlay = true
//                }
            }
        }
    }
    
    fileprivate func CheckoutButton() -> some View {
        Button(action: {
            
        }) {
            Text("")
                .frame(height: 50)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(XenColor.primaryBackground)
                .cornerRadius(0)
        }
        .padding(.horizontal, 0)
        .padding(.vertical, 0)
        .overlay(
            HStack {
            Text("Checkout")
                .font(.system(size: 18.0, weight: .semibold, design: .default))
                .foregroundColor(XenColor.primaryText)
                Image(systemName: "creditcard.fill")
                    .foregroundColor(XenColor.primaryText)
            }
        )
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cartViewModel: CartViewModel(cart: Cart(id: 1, userId: 1, date: Date.now), products: []))
    }
}
