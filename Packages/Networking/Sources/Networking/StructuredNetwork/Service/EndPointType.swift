//
//  EndPointType.swift
//  
//
//  Created by mohamed ahmed on 11/05/2024.
//

import Foundation


public protocol EndPointType {
    var baseURL: URL { get }
    var path: ServerPaths { get }
    var pathArgs: [String]? { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

extension EndPointType {
    
    var environmentBaseURL : String {
        return "\(AppConfigManager.shared.getSelectedBaseURL())/" 
    }
    
    public var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var pathArgs: [String]?  {
        return nil
    }
    
    var requestURL: URL {
        return baseURL.appendingPathComponent(path.rawValue.formatted(with: self.pathArgs))
    }

}


extension String {
    func formatted(with args: [String]?) -> String {
        guard let args = args, args.count > 0 else {
            return self
        }
        var data = self
        for i in 0...args.count - 1 {
            data =  data.replacingOccurrences(of: "{\(i)}", with: args[i])
        }
        return data
    }
}




