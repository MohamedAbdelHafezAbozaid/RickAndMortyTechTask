//
//  SheetNavigationState.swift
//
//
//  Created by mohamed ahmed on 29/05/2024.
//

import Foundation
import SwiftUI

class SheetsHandler<Sheet: SheetEnum> {
    var currentSheet: Sheet?
    @Published var currentConfig: Set<PresentationDetent>
    @Published var visibility: Visibility
    
    init(
        currentSheet: Sheet? = nil,
        currentConfig: Set<PresentationDetent>,
        visibility: Visibility
    ) {
        self.currentSheet = currentSheet
        self.currentConfig = currentConfig
        self.visibility = visibility
    }
}

public final class SheetNavigationState<Sheet: SheetEnum>: ObservableObject {
    @Published var currentSheet: Sheet?
    var sheetsHandler: SheetsHandler<Sheet>!
    var sheetsConfig: [SheetsHandler<Sheet>] = []
    
    public func presentSheet(
        _ sheet: Sheet,
        heightConfig: Set<PresentationDetent> = [.large],
        dragNotichVisibiblity: Visibility = .visible
    ) {
        Task {
            await MainActor.run {
                let handler = SheetsHandler(currentSheet: sheet, currentConfig: heightConfig, visibility: dragNotichVisibiblity)
                sheetsConfig.append(handler)
                if sheetsConfig.count == 1 {
                    sheetsHandler = handler
                    currentSheet = sheet
                }
            }
        }
    }
    
    @MainActor
    public func sheetDismissed() {
        Task {
            await MainActor.run {
                _ = sheetsConfig.count != 0 ? sheetsConfig.removeFirst() : nil
                if let nextConfig = sheetsConfig.first {
                    sheetsHandler = nextConfig
                    currentSheet = nextConfig.currentSheet
                }
            }
        }
    }
}



