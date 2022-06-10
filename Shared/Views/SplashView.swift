//
//  SplashView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive:Bool = false
    @State var title: String = ""
    @StateObject private var fetcher = ProductsFetcher()
    
    var body: some View {
        VStack {
            if self.isActive {
                TabbarView()
                    .environmentObject(fetcher)
            } else {
                Text(title)
                    .font(Font.system(size: 48, weight: .semibold, design: .monospaced))
                    .foregroundColor(XenColor.title)
                    .transition(.opacity)
                    .id(title)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(XenColor.primaryBackground)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    self.title = Constant.XenString.appTitle
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        
        .task {
            fetcher.fetchProducts()
            fetcher.fetchCategories()
        }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
