//
//  CharactersTableView.swift
//  
//
//  Created by mohamed ahmed on 12/05/2024.
//

import Foundation
import UIKit
import SwiftUI
import struct Commons.MainCharacter

struct CharactersTableView: UIViewRepresentable {
     
    var viewModel: CharacterListViewModel
    var frame: CGRect
    
    var actionCallback: ((MainCharacter) -> Void)?
    
    
    func makeUIView(context: Context) -> UIView {
        let uiView = CharactersScrollView(frame: frame, viewModel: viewModel)
        uiView.backgroundColor = .clear
        
        uiView.didTap = actionCallback
        
        return uiView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.backgroundColor = .clear
    }
}
