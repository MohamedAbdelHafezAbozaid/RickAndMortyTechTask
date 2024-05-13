//
//  FilterCollectionView.swift
//
//
//  Created by mohamed ahmed on 11/05/2024.
//

import Foundation
import UIKit
import SwiftUI

struct FilterCollectionView: UIViewRepresentable {
    
    var viewModel: CharacterListViewModel
    var frame: CGRect 
    
    func makeUIView(context: Context) -> UIView {
        let uiView = FilterScrollView(frame: frame, viewModel: viewModel)
        uiView.backgroundColor = .clear
        return uiView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.backgroundColor = .clear
    }
}

