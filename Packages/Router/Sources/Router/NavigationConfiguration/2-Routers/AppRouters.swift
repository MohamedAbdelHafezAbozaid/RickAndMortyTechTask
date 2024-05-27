//
//  AppRouters.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import Foundation
import SwiftUI
import struct Commons.MainCharacter
import protocol AppCore.CharactersLoaderRepositoryProtocol

public enum AppRoute: Hashable {
    case CharactersListScreen(mainNav: NavigationStateProtocol)
    case DetailsScreen(mainNav: NavigationStateProtocol, character: MainCharacter)
    
    public static func == (lhs: AppRoute, rhs: AppRoute) -> Bool {
        switch (lhs, rhs) {
        case (.CharactersListScreen, .CharactersListScreen):
            return true
        case let (.DetailsScreen(_,character1), .DetailsScreen(_,character2)):
            return character1.id == character2.id
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .CharactersListScreen:
            hasher.combine(0)
        case let .DetailsScreen(_,character):
            hasher.combine(character.id)
        }
    }
}

extension AppRoute: View, MainDependancyContainer {
    
    public var body: some View {
        switch self {
        case let .CharactersListScreen(mainNav):
            characterListViewContainer(mainNav: mainNav)
        case let .DetailsScreen(mainNav,character):
            detailsScreenCreator(mainNav: mainNav, character: character)
        }
    }
}

