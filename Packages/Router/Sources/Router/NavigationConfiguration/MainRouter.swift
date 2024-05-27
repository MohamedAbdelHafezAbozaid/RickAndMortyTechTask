//
//  MainRouter.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import SwiftUI

public enum Route: View, Hashable, Equatable {
    case app(AppRoute)
    
    
    public static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case let (.app(appRoute1), .app(appRoute2)):
            return appRoute1 == appRoute2 
        }
    }
    
    public var body: some View {
        switch self {
        case let .app(route):
            route
        }
    }
}



