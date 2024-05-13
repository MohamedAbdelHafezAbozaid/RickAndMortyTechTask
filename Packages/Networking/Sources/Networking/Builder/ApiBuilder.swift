//
//  ApiBuilder.swift
//
//
//  Created by mohamed ahmed on 11/05/2024.
//

import Foundation

public enum ApiBuilder {
    case character(page: Int, status: String?)
}


extension ApiBuilder: EndPointType {
    
    
    var parameters: Parameters? {
        switch self {
        case let .character(page, status):
            var params: [String: Any] = ["page": page]
            if let status = status {
                params["status"] = status
            }
            return params
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        default:
            return defaultHeaders 
        }
    }
    
    public var task: HTTPTask {
        switch self {
        default:
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: parameters, additionHeaders: headers)
        }
        
    }
    
    public var path: ServerPaths {
        switch self {
        case .character:
            return .character
        }
    }
    
    public var pathArgs: [String]? {
        switch self {
        case .character:
            return nil
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
}




