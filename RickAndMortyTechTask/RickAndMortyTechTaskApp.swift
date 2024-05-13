//
//  RickAndMortyTechTaskApp.swift
//  RickAndMortyTechTask
//
//  Created by mohamed ahmed on 13/05/2024.
//

import SwiftUI
import struct Router.AppNavHandler

@main
struct RickAndMortyTechTaskApp: App {
    var body: some Scene {
        WindowGroup {
            AppNavHandler()
        }
    }
}
