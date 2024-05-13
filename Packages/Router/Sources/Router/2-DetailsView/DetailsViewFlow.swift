//
//  DetailsViewFlow.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import Foundation
import protocol CharactersList.DetailsScreenRouterProtocol

class DetailsScreenRouter: DetailsScreenRouterProtocol {

    let nav = NavigationState.shared
    func goBack() {
        nav.goBack() 
    }
}

