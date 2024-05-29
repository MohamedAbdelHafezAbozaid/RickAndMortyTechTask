//
//  CommonRoute.swift
//  
//
//  Created by mohamed ahmed on 29/05/2024.
//

import Foundation
import SwiftUI
import struct Commons.MainCharacter

public enum CommonRoute: Hashable {
    case DetailsScreen(mainNav: NavigationStateProtocol, character: MainCharacter)
    
    public static func == (lhs: CommonRoute, rhs: CommonRoute) -> Bool {
        switch (lhs, rhs) {
        case let (.DetailsScreen(_, character1), .DetailsScreen(_, character2)):
            return character1.id == character2.id
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case let .DetailsScreen(_, character):
            hasher.combine(character.id)
        }
    }
}

extension CommonRoute: View, MainDependancyContainer {
    public var body: some View {
        switch self {
        case let .DetailsScreen(mainNav, character):
            detailsScreenCreator(mainNav: mainNav, character: character)
        }
    }
    
    @MainActor @ViewBuilder
    public func view(coordinator: SheetNavigationState<AppSheet>, completion: @escaping(Route) -> Void) -> some View {
        switch self {
        case let .DetailsScreen(mainNav, character):
            detailsScreenCreator(mainNav: mainNav, character: character)
        }
    }
}
