//
//  NavigationState.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import SwiftUI

public protocol NavigationStateProtocol {
    var sheetCoordinator: SheetNavigationState<AppSheet> {get set}
    func goTo(_ route:Route)
    func goBack()
}

public final class AppNavHandlerViewModel: NavigationStateProtocol , ObservableObject {
    
    @Published public var appRoutes: [Route] = []
    public var sheetCoordinator = SheetNavigationState<AppSheet>()
    
    public func goTo(_ route:Route) { 
        Task {
            await MainActor.run {
                appRoutes.append(route)
            }
        }
    }
    
    public func goBack() {
        Task {
            await MainActor.run {
                _ = appRoutes.popLast()
            }
        }
    }
}




