//
//  AppConfigManager.swift
//
//
//  Created by mohamed ahmed on 11/05/2024.
//

import Foundation

enum AppBaseURL: String, Codable {
    case staging = "https://rickandmortyapi.com/api" 
    
}


class AppConfigManager {
    static let shared = AppConfigManager()
    
    //MARK: BaseURL
    func selectBaseUrl(_ url: AppBaseURL) {
        NetworkingAppDefault.shared.save(url, forKey: .baseUrl)
    }
    
    func getSelectedBaseURL() -> String {
        guard let baseUrl: AppBaseURL = NetworkingAppDefault.shared.get(.baseUrl) else { return AppBaseURL.staging.rawValue }
        return baseUrl.rawValue
    }
}


