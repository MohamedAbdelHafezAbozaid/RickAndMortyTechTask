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
    
    let nav = NavigationState.shared
    func openDetails(character: MainCharacter) {
        nav.goTo(.app(.DetailsScreen(character: character))) 
    }
}
