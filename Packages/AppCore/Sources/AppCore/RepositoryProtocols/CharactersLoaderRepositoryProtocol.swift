//
//  CharactersLoaderRepositoryProtocol.swift
//
//
//  Created by mohamed ahmed on 11/05/2024.
//

import Foundation
import Networking
import struct Commons.PresentableResponse

public protocol CharactersLoaderRepositoryProtocol: HTTPClient {
    func loadCharacters(page: Int, status: String?) async throws -> PresentableResponse 
}
