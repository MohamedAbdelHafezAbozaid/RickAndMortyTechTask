//
//  HTTPTask.swift
//
//
//  Created by mohamed ahmed on 11/05/2024.
//

import Foundation
import UIKit

public typealias HTTPHeaders = [String:String]

public var defaultHeaders: HTTPHeaders {
    get{
        var header = HTTPHeaders()
        header["Content-Type"] = "application/json"
        return header
    }
}

public enum HTTPTask {
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?) 
}







