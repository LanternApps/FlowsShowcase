//
//  ViewModel.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import Combine

@dynamicMemberLookup
protocol ViewModel: ObservableObject {
    
    associatedtype State: Hashable

    var state: State { get set }
}

extension ViewModel {

    subscript<Value>(dynamicMember keyPath: KeyPath<State, Value>) -> Value {
        state[keyPath: keyPath]
    }
}
