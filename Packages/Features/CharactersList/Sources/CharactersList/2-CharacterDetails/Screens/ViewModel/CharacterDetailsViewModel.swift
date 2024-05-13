//
//  CharacterDetailsViewModel.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import Foundation
import struct Commons.MainCharacter

public final class CharacterDetailsViewModel {
    let character: MainCharacter
    
    public init(
        character:MainCharacter 
    ) {
        self.character = character
    }
    
}

