//
//  BaseResponse.swift
//  
//
//  Created by mohamed ahmed on 11/05/2024.
//

import Foundation



public struct BaseResponse: Codable {
    public let info: Info?
    public let results: [CharacterInfo]?
}

public struct Info: Codable {
    public let count: Int?
    public let next: String?
    public let pages: Int?
    public let prev: String? 
}

public struct CharacterInfo: Codable {
    public let created: String?
    public let episode: [String]?
    public let gender: String?
    public let id: Int?
    public let image: String?
    public let location: Location?
    public let name: String?
    public let origin: Origin?
    public let species: String?
    public let status: RemoteFilterStatus?
    public let type: String?
    public let url: String?
}

public struct Location: Codable {
    public let name: String?
    public let url: String?
}

public struct Origin: Codable {
    public let name: String?
    public let url: String?
}

public enum RemoteFilterStatus: String, Codable {
    case Alive
    case Dead
    case unknown
}
