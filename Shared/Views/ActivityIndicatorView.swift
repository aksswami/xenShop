//
//  ActivityIndicatorView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import SwiftUI

struct ActivityIndicatorView: View {
    let style = StrokeStyle(lineWidth: 15, lineCap: .round)
    @State var animate = false
    let color1 = Color.gray
    let color2 = Color.gray.opacity(0.5)
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(AngularGradient(gradient: .init(colors: [color1, color2]), center: .center))
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                
                .animation(Animation.easeInOut(duration: 0.7).repeatForever(), value: Angle(degrees: animate ? 360 : 0))
        }.onAppear() {
            self.animate.toggle()
        }
    }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
            .frame(width: 40, height: 40, alignment: .center)
    }
}
