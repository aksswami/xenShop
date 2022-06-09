//
//  XenShopError.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 9/6/22.
//

import Foundation
import Moya

public enum XenShopError: Swift.Error {
    case offline
    case timeout
    case requestFailed(String)
    case parameterEncoding(Error)
    case mappingError(Error, Response?)
    case underlying(Error, Response?)
    case generic(Error)
    case system(String)
    
    public var message: String {
        switch self {
        case .offline:
            return "An Internet connection is required. Please check your connection, then try again."
        case .generic(let error):
            return "Generic Error: \(error.localizedDescription)"
        case .mappingError(let error, _):
            if let decodingError = error as? DecodingError {
                switch decodingError {
                case .typeMismatch(let type, let context):
                    return "\(context.debugDescription) (\(context.codingPath.debugDescription)) type: \(type)"
                case .valueNotFound(let value, let context):
                    return "\(context.debugDescription) (\(context.codingPath.debugDescription)) value: \(value)"
                case .keyNotFound(let codingKey, let context):
                    return "\(context.debugDescription) (\(codingKey))"
                case .dataCorrupted(let context):
                    return context.debugDescription
                @unknown default:
                    return "Unhandled: \(error.localizedDescription)"
                }
            } else if let encodingError = error as? EncodingError {
                switch encodingError {
                case .invalidValue(let value, let context):
                    return "\(context.debugDescription) (\(context.codingPath.debugDescription)) value: \(value)"
                @unknown default:
                    return "Unhandled: \(error.localizedDescription)"
                }
            } else {
                return error.localizedDescription
            }
        case .underlying(let error, let response):
            return "Underlying error: \(error.localizedDescription) \(response?.debugDescription ?? "")"
        case .timeout:
            return "Operation Timeout. Please try again."
        case .parameterEncoding(let error):
            return error.localizedDescription
        case .requestFailed(let url):
            return "URL request failed: \(url.debugDescription)"
        case .system(let error):
            return error
        }
    }
}
