//
//  CharacterDetailsView.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import SwiftUI
import Kingfisher

public struct CharacterDetailsView: View {
    
    let viewModel: CharacterDetailsViewModel
    @State private var router: DetailsScreenRouterProtocol
    
    public init(
        viewModel: CharacterDetailsViewModel,
        router: DetailsScreenRouterProtocol
    ) {
        self.viewModel = viewModel
        _router = State(initialValue: router)
    }
    
    
    public var body: some View {
        GeometryReader(content: { geometry in
            VStack(alignment: .leading) {
                CharacterImageView(
                    size: geometry.size,
                    image: URL(string: viewModel.character.image) 
                )
                
                CharacterInfoView(
                    character: viewModel.character
                )
            }
        })
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    router.goBack()
                }, label: {
                    ZStack{
                        Circle()
                            .frame(width: 40)
                            .foregroundStyle(.white)
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 20, height: 15)
                            .foregroundStyle(.black)
                    }
                })
            }
        }
    }
}

