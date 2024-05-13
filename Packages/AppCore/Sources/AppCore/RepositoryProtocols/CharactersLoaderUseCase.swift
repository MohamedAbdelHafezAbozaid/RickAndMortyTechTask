//
//  CharactersLoaderUseCase.swift
//
//
//  Created by mohamed ahmed on 11/05/2024.
//

import Foundation
import Networking
import Commons


public typealias RemoteCharactersLoaderProtocols = CharactersLoaderRepositoryProtocol & HTTPClient
public final class RemoteCharactersLoader: RemoteCharactersLoaderProtocols {
    public init() { }
    
    public func loadCharacters(page: Int, status: String?) async throws -> PresentableResponse {
        do {
            let response = try await sendRequest(ApiBuilder.character(page: page, status: status), model: BaseResponse.self)
            guard let remoteCharacters = response.results else {throw Error.invalidData}
            let info = PresentableResponse(
                paginationEnds: checkIfPaginationEnds(remote: response),
                characters: remoteCharacters.toModels()
            )
            return info
        } catch {
            throw error
        }
    }
    
    private func checkIfPaginationEnds(remote: BaseResponse) -> Bool {
        guard let results = remote.results?.count, results == 20 else { return true }
        guard let info = remote.info, info.next != nil else { return true }
        return false
    }
}

public extension Array where Element == CharacterInfo {
    func toModels() -> [MainCharacter] {
        return self.map {
            MainCharacter(
                id: $0.id ?? 0,
                name: $0.name ?? "",
                image: $0.image ?? "",
                species: $0.species ?? "",
                status: statusMapper($0.status),
                gender: $0.gender ?? "",
                location: $0.location?.name ?? "" 
            )
        }
    }
    
    func statusMapper(_ remote: RemoteFilterStatus?) -> FilterStatus {
        switch remote {
        case .Alive:
            return .Alive
        case .Dead:
            return .Dead
        default:
            return .unknown
        }
    }
}
