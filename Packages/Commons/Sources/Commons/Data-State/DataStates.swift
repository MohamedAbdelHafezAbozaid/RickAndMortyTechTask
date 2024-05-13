//
//  DataStates.swift
//
//
//  Created by mohamed ahmed on 11/05/2024.
//

import Foundation

public enum DataStates: Hashable {
    case loading
    case finished(Outcome)
        
    public enum Outcome: Hashable { 
        case success
    }

}


public typealias DataState =  Result<DataStates, Error>

