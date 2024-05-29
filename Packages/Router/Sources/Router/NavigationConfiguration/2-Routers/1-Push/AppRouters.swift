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
    case Common(CommonRoute)
    
    public static func == (lhs: AppRoute, rhs: AppRoute) -> Bool {
        switch (lhs, rhs) {
        case (.CharactersListScreen, .CharactersListScreen):
            return true
        case let (.Common(lhsCommon), .Common(rhsCommon)):
            return lhsCommon == rhsCommon
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .CharactersListScreen:
            hasher.combine(0)
        case let .Common(commonRoute):
            hasher.combine(commonRoute)
        }
    }
}

extension AppRoute: View, MainDependancyContainer {
    
    public var body: some View {
        switch self {
        case let .CharactersListScreen(mainNav):
            characterListViewContainer(mainNav: mainNav)
        case let .Common(commonRoute):
            commonRoute.body
        }
    }
}

