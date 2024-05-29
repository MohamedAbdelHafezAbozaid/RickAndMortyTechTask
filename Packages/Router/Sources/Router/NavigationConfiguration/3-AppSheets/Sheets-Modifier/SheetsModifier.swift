//
//  SheetsModifier.swift
//
//
//  Created by mohamed ahmed on 29/05/2024.
//

import SwiftUI

public struct SheetsModifier: ViewModifier {
    
    var nav: NavigationStateProtocol
    
    public init(nav: NavigationStateProtocol) {
        self.nav = nav
    }
    
    public func body(content: Content) -> some View {
        content
            .sheetCoordinating(coordinator: nav.sheetCoordinator, completion: { route in
                
            })
    }
}

public extension View {
    func sheetsConfig(nav: NavigationStateProtocol) -> some View {
        self.modifier(SheetsModifier(nav: nav))
    }
}


