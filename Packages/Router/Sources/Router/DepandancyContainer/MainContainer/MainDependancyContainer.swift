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
    case listScreen
    case DetailsScreen(character: MainCharacter)
}


public protocol MainDependancyContainer {
    associatedtype T: View
    @ViewBuilder
    func dependancyCreator(view: AppViews) -> T
}

extension MainDependancyContainer {
    @MainActor
    public func dependancyCreator(view: AppViews) -> some View {
        Group {
            switch view {
            case .listScreen:
                CharacterListView(
                    viewModel: VMCreator.ListViewModel(
                        loader: RemoteCharactersLoader() 
                    ),
                    router: ListScreenRouter()
                )
            case let .DetailsScreen(character):
                CharacterDetailsView(
                    viewModel: VMCreator.CharacterViewModel(
                        character: character
                    ),
                    router: DetailsScreenRouter()
                )
            }
        }
    }
}

