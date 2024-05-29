//
//  File.swift
//  
//
//  Created by mohamed ahmed on 29/05/2024.
//

import struct Commons.MainCharacter
import struct CharactersList.CharacterDetailsView
import SwiftUI

public protocol DetailsScreenContaine {
    @ViewBuilder
    func detailsScreenCreator(mainNav: NavigationStateProtocol, character: MainCharacter) -> CharacterDetailsView
}

extension DetailsScreenContaine {
    @MainActor
    public func detailsScreenCreator(mainNav: NavigationStateProtocol, character: MainCharacter) -> CharacterDetailsView {
        CharacterDetailsView(
            viewModel: VMCreator.CharacterViewModel(
                character: character
            ),
            router: DetailsScreenRouter(mainNav: mainNav)
        )
    }
}



