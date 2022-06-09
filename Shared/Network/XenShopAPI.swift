//
//  XenShopAPI.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 9/6/22.
//

import Foundation
import Moya

enum XenShopAPI: TargetType {
    case products
    case product(id: Int)
    case cart(userId: Int)
    
    var path: String {
        switch self {
        case .products:
            return "products"
        case .product(id: let id):
            return "products/\(id)"
        case .cart:
            return "cart"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var baseURL: URL {
        guard let baseURL = URL(string: BASE_URL) else { fatalError("BaseURL not valid") }
        return baseURL
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .products, .product:
            return .requestPlain
        case .cart(userId: let userId):
            return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
