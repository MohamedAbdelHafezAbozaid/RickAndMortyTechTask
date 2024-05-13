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
    case DetailsScreen(mainNav: NavigationStateProtocol,character: MainCharacter)
    
    public static func == (lhs: AppRoute, rhs: AppRoute) -> Bool {
        switch (lhs, rhs) {
        case let (.DetailsScreen(_, character1), .DetailsScreen(_, character2)):
            return character1.id == character2.id
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case let .DetailsScreen(_ ,character):
            hasher.combine(character.id)
        }
    }
}

extension AppRoute: View {
    
    public var body: some View {
        switch self {
        case let .DetailsScreen(mainNav ,character):
            AppScreens.dependancyCreator(view: .DetailsScreen(mainNav: mainNav, character: character))
        }
    }
}

