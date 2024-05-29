//
//  AppSheetRoute.swift
//
//
//  Created by mohamed ahmed on 29/05/2024.
//

import Foundation
import SwiftUI
import struct Commons.MainCharacter

public enum AppSheet: Identifiable, SheetEnum, MainDependancyContainer {
    case Common(CommonRoute)
    
    public var id: UUID { UUID() }
    
    @MainActor @ViewBuilder
    public func view(coordinator: SheetNavigationState<AppSheet>, completion: @escaping(Route) -> Void) -> some View {
        switch self {
        case let .Common(commonRoute):
            commonRoute.view(coordinator: coordinator, completion: completion)
        }
    }
}
