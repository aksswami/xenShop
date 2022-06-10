//
//  LineView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import SwiftUI

struct LineView: View {
    var body: some View {
        Rectangle()
            .frame(width: nil, height: 0.5, alignment: .leading)
            .foregroundColor(.gray)
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView()
    }
}
