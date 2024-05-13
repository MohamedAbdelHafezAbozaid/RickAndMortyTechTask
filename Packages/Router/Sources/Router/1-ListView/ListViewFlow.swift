//
//  ListViewFlow.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import Foundation
import protocol CharactersList.ListScreenRouterProtocol
import struct Commons.MainCharacter

class ListScreenRouter: ListScreenRouterProtocol {
    
    let mainNav: NavigationStateProtocol
    init(mainNav: NavigationStateProtocol) {
        self.mainNav = mainNav
    }
    func openDetails(character: MainCharacter) {
        mainNav.goTo(.app(.DetailsScreen(mainNav: mainNav, character: character)))
    }
}
