//
//  DetailsViewFlow.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import Foundation
import protocol CharactersList.DetailsScreenRouterProtocol

class DetailsScreenRouter: DetailsScreenRouterProtocol {

    let mainNav: NavigationStateProtocol
    init(mainNav: NavigationStateProtocol) {
        self.mainNav = mainNav
    }
    func goBack() {
        mainNav.goBack() 
    }
}

