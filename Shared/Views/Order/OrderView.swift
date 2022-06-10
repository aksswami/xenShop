//
//  OrderView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        VStack {
            Image(systemName: "checkmark.square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.green)
                .frame(width: 100, height: 100, alignment: .center)
            Text("Order successfuly placed.")
                .font(.title2)
                .multilineTextAlignment(.center)
        }
        .navigationTitle(Constant.XenString.order)
        .foregroundColor(XenColor.primaryText)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            cartViewModel.cart.products = []
            print("Cart Reset.")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(cartViewModel: CartViewModel(cart: Cart(id: 1, userId: 1, date: Date.now), products: []))
    }
}
