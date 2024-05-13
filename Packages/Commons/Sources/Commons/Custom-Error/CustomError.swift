// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum Error: Swift.Error {
    case connectivity
    case invalidData
    case notFound
}

extension Error: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .connectivity: 
            return NSLocalizedString("No Connection", comment: "Connectivity")
        case .invalidData:
            return NSLocalizedString("Internal Error", comment: "Invalid Data")
        case .notFound:
            return NSLocalizedString("Internal Error", comment: "Not Found")
        }
    }
}
