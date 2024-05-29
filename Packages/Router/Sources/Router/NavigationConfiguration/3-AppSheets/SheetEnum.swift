//
//  SheetEnum.swift
//
//
//  Created by mohamed ahmed on 29/05/2024.
//

import Foundation
import SwiftUI


public protocol SheetEnum: Identifiable {
    associatedtype Body: View
    @ViewBuilder
    func view(coordinator: SheetNavigationState<Self>, completion: @escaping(Route) -> Void) -> Body
}


