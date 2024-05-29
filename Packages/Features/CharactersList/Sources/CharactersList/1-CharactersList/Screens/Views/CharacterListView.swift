//
//  CharacterListView.swift
//
//
//  Created by mohamed ahmed on 11/05/2024.
//

import SwiftUI

public struct CharacterListView: View {
    @ObservedObject var viewModel: CharacterListViewModel
    @State private var router: ListScreenRouterProtocol
    public init(
        viewModel: CharacterListViewModel,
        router: ListScreenRouterProtocol
    ) {
        self.viewModel = viewModel
        _router = State(initialValue: router) 
    }
    public var body: some View {
            GeometryReader { geometry in
                VStack(spacing: 20){
                    FilterCollectionView(
                        viewModel: viewModel,
                        frame: CGRect(
                            x: 0,
                            y: 0,
                            width: geometry.size.width,
                            height: 40
                        )
                    )
                    .frame(width: geometry.size.width, height: 40)
                    CharactersTableView(
                        viewModel: viewModel,
                        frame: CGRect(
                            x: 0,
                            y: 0,
                            width: geometry.size.width,
                            height: geometry.size.height
                        )
                    ) { selectedCharacter in
                        router.openDetails(character: selectedCharacter, presentAs: .push)
                    }
                }
            }
        .padding(.horizontal)
        .LoadingConfig(show: viewModel.isLoading)
        .onViewDidLoad {
            viewModel.receivedEvents(.fetchCharacters)
        }
        .alert(viewModel.presentableError, isPresented: viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        }
        .navigationTitle("Characters")
        .navigationBarTitleDisplayMode(.large)
    }
}

