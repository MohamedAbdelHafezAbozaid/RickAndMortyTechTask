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



public enum AppViews {
    case listScreen(mainNav: NavigationStateProtocol)
    case DetailsScreen(mainNav: NavigationStateProtocol, character: MainCharacter)
}


public protocol MainDependancyContainer {
    associatedtype Body: View
    @ViewBuilder
    static func dependancyCreator(view: AppViews) -> Body
}

public class AppScreens: MainDependancyContainer {
    @MainActor
    public static func dependancyCreator(view: AppViews) -> some View {
        Group {
            switch view {
            case let .listScreen(mainNav):
                CharacterListView(
                    viewModel: VMCreator.ListViewModel(
                        loader: RemoteCharactersLoader()
                    ),
                    router: ListScreenRouter(mainNav: mainNav)
                )
            case let .DetailsScreen(mainNav, character):
                CharacterDetailsView(
                    viewModel: VMCreator.CharacterViewModel(
                        character: character
                    ),
                    router: DetailsScreenRouter(mainNav: mainNav)
                )
            }
        }
    }
}

