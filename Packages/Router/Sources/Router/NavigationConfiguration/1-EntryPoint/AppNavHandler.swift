//
//  AppNavHandler.swift
//  
//
//  Created by mohamed ahmed on 13/05/2024.
//

import SwiftUI

public struct AppNavHandler: View {
    @StateObject private var viewModel = AppNavHandlerViewModel()

    public init() {}
    
    public var body: some View {
        let firstView: AppRoute = .CharactersListScreen(mainNav: viewModel)
        NavigationStack(path: $viewModel.appRoutes) {
            firstView
                .navigationsConfig()
        }
    }
}
