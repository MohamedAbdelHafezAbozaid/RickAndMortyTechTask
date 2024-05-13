//
//  AppNavHandler.swift
//  
//
//  Created by mohamed ahmed on 13/05/2024.
//

import SwiftUI

public struct AppNavHandler: View {
    @StateObject private var MainNav = NavigationState()
    
    public init() {}
    public var body: some View {
        NavigationStack(path: $MainNav.appRoutes) {
            AppScreens.dependancyCreator(view: .listScreen(mainNav: MainNav))
                .navigationsConfig()
        }
    }
}
