//
//  PresentableResponse.swift
//
//
//  Created by mohamed ahmed on 11/05/2024.
//

import Foundation

public struct PresentableResponse {
    public var paginationEnds: Bool
    public var characters: [MainCharacter]
    
    public init(paginationEnds: Bool, characters: [MainCharacter]) {
        self.paginationEnds = paginationEnds
        self.characters = characters
    }
}

public struct MainCharacter {
    public var id: Int
    public var name: String
    public var image: String
    public var species: String
    public var status: FilterStatus
    public var gender: String
    public var location: String
    
    public init(
        id: Int,
        name: String,
        image: String,
        species: String,
        status: FilterStatus, 
        gender: String,
        location: String
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.species = species
        self.status = status
        self.gender = gender
        self.location = location
    }
}

public enum FilterStatus: String, CaseIterable {
    case Alive
    case Dead
    case unknown
}
