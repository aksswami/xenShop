//
//  XenColor.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import Foundation
import SwiftUI

struct XenColor {
    static let primaryBlack = Color.init(hex: "1F1F1F")
    static let secondaryBlack = Color.init(hex: "464B5F")
    static let lightGrayColor = Color.init(hex: "F9F9F9")
    static let primaryRed = Color.init(hex: "CB2D3E")
    static let secondaryRed = Color.init(hex: "EF473A")
    static let gradientRedHorizontal = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "CB2D3E"), Color.init(hex: "EF473A")]), startPoint: .leading, endPoint: .trailing)
    static let gradientRedVertical = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "CB2D3E"), Color.init(hex: "EF473A")]), startPoint: .bottom, endPoint: .top)
    static let shadowColor = Color.init(hex: "dddddd")
    static let lightGreen = Color.init(hex: "e8fbe8")
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}

