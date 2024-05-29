//
//  ListScreenRouterProtocol.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import Foundation
import struct Commons.MainCharacter

public enum presentationType {
    case push
    case sheet
}

public protocol ListScreenRouterProtocol {
    func openDetails(character: MainCharacter, presentAs: presentationType)
}
