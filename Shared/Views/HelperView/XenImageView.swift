//
//  XenImageView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import SwiftUI

struct XenImageView: View {
    @State var url: URL?
    
    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .padding([.all], 0)
                .cornerRadius(0)
                .frame(width: nil, height: nil, alignment: .center)
            } else if let _ = phase.error {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.all], 20)
                    .foregroundColor(XenColor.primaryBackground.opacity(0.5))
            } else {
                ActivityIndicatorView()
                    .frame(width: 40, height: 40, alignment: .topLeading)
            }
        }
    }
}

struct XenImageView_Previews: PreviewProvider {
    static var previews: some View {
        XenImageView()
    }
}
