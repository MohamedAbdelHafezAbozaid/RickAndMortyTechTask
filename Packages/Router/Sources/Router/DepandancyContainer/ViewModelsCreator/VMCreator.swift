//
//  VMCreator.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import Foundation
import class CharactersList.CharacterListViewModel
import class CharactersList.CharacterDetailsViewModel
import struct Commons.MainCharacter
import protocol AppCore.CharactersLoaderRepositoryProtocol

final class VMCreator {
    
    @MainActor
    static func ListViewModel(loader: CharactersLoaderRepositoryProtocol) -> CharacterListViewModel {
        return CharacterListViewModel(loader: loader) 
    }
    
    @MainActor
    static func CharacterViewModel(character: MainCharacter) -> CharacterDetailsViewModel {
        return CharacterDetailsViewModel(character: character)
    }
}

