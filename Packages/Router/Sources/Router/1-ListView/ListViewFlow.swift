//
//  ListViewFlow.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import Foundation
import protocol CharactersList.ListScreenRouterProtocol
import enum CharactersList.presentationType
import struct Commons.MainCharacter

class ListScreenRouter: ListScreenRouterProtocol {
    
    let mainNav: NavigationStateProtocol
    init(mainNav: NavigationStateProtocol) {
        self.mainNav = mainNav
    }
    func openDetails(character: MainCharacter, presentAs: presentationType) {
        let destination: CommonRoute = .DetailsScreen(mainNav: mainNav, character: character)
        switch presentAs {
        case .push:
            mainNav.goTo(.app(.Common(destination)))
            
        case .sheet:
            mainNav.sheetCoordinator.presentSheet(.Common(destination))
        }
    }
}
