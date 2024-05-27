//
//  MainDependancyContainer.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import Foundation
import SwiftUI
import struct Commons.MainCharacter
import struct CharactersList.CharacterListView
import struct CharactersList.CharacterDetailsView
import protocol AppCore.CharactersLoaderRepositoryProtocol
import class AppCore.RemoteCharactersLoader

public typealias MainDependancyContainer = CharacterListViewContainer & DetailsScreenCreator

//public protocol NeededInjection{
//    var mainNav: any NavigationStateProtocol {get}
//}

public protocol CharacterListViewContainer {
    @ViewBuilder
    func characterListViewContainer(mainNav: NavigationStateProtocol) -> CharacterListView
}

extension CharacterListViewContainer {
    @MainActor
    public func characterListViewContainer(mainNav: NavigationStateProtocol) -> CharacterListView {
        CharacterListView(
            viewModel: VMCreator.ListViewModel(
                loader: RemoteCharactersLoader()
            ),
            router: ListScreenRouter(mainNav: mainNav)
        )
    }
}

public protocol DetailsScreenCreator {
    @ViewBuilder
    func detailsScreenCreator(mainNav: NavigationStateProtocol, character: MainCharacter) -> CharacterDetailsView
}

extension DetailsScreenCreator {
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



