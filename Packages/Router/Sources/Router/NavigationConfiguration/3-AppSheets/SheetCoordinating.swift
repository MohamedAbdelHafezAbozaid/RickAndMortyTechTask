//
//  SheetCoordinating.swift
//
//
//  Created by mohamed ahmed on 29/05/2024.
//

import Foundation
import SwiftUI

struct SheetCoordinating<Sheet: SheetEnum>: ViewModifier {
    @StateObject var coordinator: SheetNavigationState<Sheet>
    @State var completion: (Route) -> Void
    
    func body(content: Content) -> some View {
        content
            .sheet(
                item: $coordinator.currentSheet,
                onDismiss: {
                    coordinator.sheetDismissed()
                }, content: { sheet in
                    sheet.view(
                        coordinator: coordinator,
                        completion: { route in
                            completion(route)
                        })
                    .presentationDetents($coordinator.sheetsHandler.currentConfig.wrappedValue)
                    .presentationDragIndicator($coordinator.sheetsHandler.visibility.wrappedValue)
                })
    }
}

extension View {
    func sheetCoordinating<Sheet: SheetEnum>(coordinator: SheetNavigationState<Sheet>, completion: @escaping (Route) -> Void) -> some View {
        modifier(SheetCoordinating(coordinator: coordinator, completion: completion))
    }
}

