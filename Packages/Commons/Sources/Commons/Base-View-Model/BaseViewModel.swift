//
//  BaseViewModel.swift
//
//
//  Created by mohamed ahmed on 11/05/2024.
//

import Foundation
import SwiftUI

@MainActor
open class BaseViewModel: NSObject, ObservableObject{
    
    public override init() {}
    
    @Published public var dataStatus: DataState?{ 
        didSet {
            switch dataStatus{
            case let .failure(err):
                presentableError = err.localizedDescription
                showAlert = .constant(true)
                if isLoading.wrappedValue == true {
                    isLoading = .constant(false)
                }
            case let .success(value):
                switch value {
                case .loading:
                    isLoading = .constant(true)
                case let . finished(Outcome):
                    isLoading = .constant(false)
                    switch Outcome {
                    case .success:
                        presentableError = ""
                        showAlert = .constant(false)
                    }
                }
            default:
                break
            }
        }
    }
    
    public var isLoading: Binding<Bool> = .constant(false)
    public var showAlert: Binding<Bool> = .constant(false)
    public var presentableError = ""
    
    public let defaultError = NSError(domain: "SomeThing went wrong please try again later", code: 0)
}



