//
//  File.swift
//  
//
//  Created by mohamed ahmed on 29/05/2024.
//

import struct CharactersList.CharacterListView
import class AppCore.RemoteCharactersLoader
import SwiftUI

public protocol CharacterListScreenContainer {
    @ViewBuilder
    func characterListViewContainer(mainNav: NavigationStateProtocol) -> CharacterListView
}

extension CharacterListScreenContainer {
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
