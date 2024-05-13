//
//  RickAndMortyTechTaskApp.swift
//  RickAndMortyTechTask
//
//  Created by mohamed ahmed on 13/05/2024.
//

import SwiftUI
import protocol Router.MainDependancyContainer
import class Router.NavigationState

@main
struct RickAndMortyTechTaskApp: App, MainDependancyContainer {
    @StateObject private var navigationState = NavigationState.shared
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.appRoutes) {
                dependancyCreator(view: .listScreen)
                    .navigationsConfig()
            }
        }
    }
}
