//
//  TabbarView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import SwiftUI

struct TabbarView: View {
    @State var selected = 0
    @EnvironmentObject var appState: AppState
    var body: some View {
        ZStack {
            Color.init(hex: "f9f9f9")
                .edgesIgnoringSafeArea(.all)
            TabView(selection: $selected) {
                ProductsView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Products")
                    }.tag(0)
                CartView(cart: appState.cart)
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }.tag(1)
            }
        }
        .accentColor(XenColor.primaryBackground)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
