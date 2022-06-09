//
//  XenShopAPI.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 9/6/22.
//

import Foundation
import Moya
import CombineMoya
import Combine

let BASE_URL: String = "https://fakestoreapi.com"

protocol Networkable {
    var provider: MoyaProvider<XenShopAPI> { get }
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<XenShopAPI>(plugins: [NetworkLoggerPlugin()])
}

extension NetworkManager {
    func request<T: Decodable>(target: XenShopAPI, responseType: T.Type) -> AnyPublisher<T, XenShopError> {
        return provider.requestPublisher(target)
            .mapResponse(T.self)
            .eraseToAnyPublisher()
    }
}


extension AnyPublisher where Output == Response, Failure == MoyaError {
    func mapResponse<T: Decodable>(_ type: T.Type) -> AnyPublisher<T, XenShopError> {
        return self
            .map(type, using: JSONDecoder(), failsOnEmptyData: false)
            .mapError { moyaError -> XenShopError in
                switch moyaError {
                case .imageMapping, .jsonMapping, .stringMapping:
                    return .generic(moyaError)
                case .statusCode(let response):
                    switch response.statusCode {
                    case 500...599:
                        return .generic(moyaError)
                    case 499:
                        return .timeout
                    default:
                        return .generic(moyaError)
                    }
                case let .objectMapping( error, response):
                    // error is DecodingError
                    return .mappingError(error, response)
                case .encodableMapping(let error):
                    return .mappingError(error, moyaError.response)
                case .underlying(let error, let response):
                    return .underlying(error, response)
                case .requestMapping(let url):
                    return .requestFailed(url)
                case .parameterEncoding(let error):
                    return .parameterEncoding(error)
                }
            }
            .eraseToAnyPublisher()
    }
}

