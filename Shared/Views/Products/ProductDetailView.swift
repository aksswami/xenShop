//
//  ProductView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

import SwiftUI

struct ProductDetailView: View {
    @State var product: Product
    var body: some View {
        GeometryReader { geomerty in
            VStack {
                ScrollView {
                    ZStack {
                        XenColor.lightGrayColor
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            VStack(alignment: .center) {
                                AsyncImage(url: product.image) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding([.all], 0)
                                        .cornerRadius(0)
                                        .frame(width: nil, height: nil, alignment: .center)
                                    
                                } placeholder: {
                                    ActivityIndicatorView()
                                        .frame(width: 40, height: 40, alignment: .topLeading)
                                    
                                }
                                .frame(width: nil, height: geomerty.size.height * 0.6, alignment: .center)
                                .padding([.all], 0)
                                
                                VStack(alignment: .leading) {
                                    Text(product.title)
                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                        .foregroundColor(XenColor.secondaryBlack)
                                        .lineLimit(nil)
                                        .padding([.horizontal], 15)
                                        .padding(.bottom, 5)
                                    Spacer()
                                    Text(product.presentablePrice)
                                        .font(.system(size: 14, weight: .semibold, design: .default))
                                        .foregroundColor(.gray)
                                        .padding([.horizontal], 15)
                                    Spacer()
                                    Rectangle()
                                        .frame(width: nil, height: 0.5, alignment: .leading)
                                        .foregroundColor(.gray)
                                    
                                    Text("Product Details")
                                        .font(.system(size: 16, weight: .semibold, design: .default))
                                        .foregroundColor(XenColor.secondaryBlack)
                                        .padding(.top, 10)
                                        .padding(.horizontal, 15)
                                    Text(product.description ?? "")
                                        .font(.system(size: 14, weight: .light, design: .default))
                                        .foregroundColor(XenColor.secondaryBlack)
                                        .padding(.vertical, 5)
                                        .lineSpacing(2)
                                        .padding(.horizontal, 15)
                                        .lineLimit(nil)
                                }
                            }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.white)
                        .padding(.top, -3)
                        
                    }
                }
                
                AddToCartButton()
            }
            .navigationBarTitle(product.title, displayMode: .inline)
        }
    }
    
    fileprivate func AddToCartButton() -> some View {
        Button(action: {
            
        }) {
            Text("")
                .frame(height: 65)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(XenColor.gradientRedHorizontal)
                .cornerRadius(0)
        }
        .padding(.horizontal, 0)
        .overlay(
            Text("Add To Cart")
                .font(.system(size: 18.0, weight: .heavy, design: .default))
                .foregroundColor(.white)
                .padding(.top, -10)
        )
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(id: 1,
                              title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                              price: 109.95,
                              description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                              category: "men's clothing",
                              image: URL(string: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")!,
                              rating: Product.Rating(rate: 3.9, count: 120))
        ProductDetailView(product: product)
    }
}
