//
//  CharacterListViewModel.swift
//
//
//  Created by mohamed ahmed on 11/05/2024.
//

import Foundation
import class Commons.BaseViewModel
import enum Commons.Error
import struct Commons.PresentableResponse
import struct Commons.MainCharacter
import protocol AppCore.CharactersLoaderRepositoryProtocol

public final class CharacterListViewModel: BaseViewModel {
    var canLoadMore = true
    var currentPage: Int = 0
    private(set) var filter: String? = nil
    @Published private(set) var characters = [MainCharacter]()
    
    let loader: CharactersLoaderRepositoryProtocol
    
    public init(
        loader: CharactersLoaderRepositoryProtocol
    ) {
        self.loader = loader
    }
    
    enum events {
        case selected(filter: String)
        case fetchCharacters
    }
    
    @MainActor
    func receivedEvents(_ event: events) {
        Task {
            switch event {
            case let .selected(filter): 
                await filterSelected(filter: filter)
            case .fetchCharacters:
                _ = canLoadMore ? await fetchCharacters() : nil
            }
        }
    }
    
    private func filterSelected(filter: String) async {
        self.filter = filter
        canLoadMore = true
        characters.removeAll()
        currentPage = 0
        await fetchCharacters()
    }
    
    private func fetchCharacters() async {
        dataStatus = .success(.loading)
        do {
            currentPage += 1
            let info = try await loader.loadCharacters(page: currentPage, status: filter)
            characters.append(contentsOf: info.characters)
            canLoadMore = !info.paginationEnds
            dataStatus = .success(.finished(.success))
        } catch {
            dataStatus = .failure(.invalidData)
        }
    }
    
    
}
