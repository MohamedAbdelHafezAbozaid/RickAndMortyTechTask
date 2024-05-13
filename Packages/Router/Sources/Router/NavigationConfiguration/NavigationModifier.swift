//
//  NavigationModifier.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import SwiftUI

public struct NavigationModifier: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .navigationDestination(for: Route.self) { $0 }
    }
}

public extension View {
    func navigationsConfig(showConnectionIndicator: Bool = false) -> some View {
        self.modifier(NavigationModifier()) 
    }
}





