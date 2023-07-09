//
//  AuthVM.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import Combine
import SharedCore

class AuthVM: ViewModel {
    private var service: AuthService
    
    @Published var state: State
    
    struct State: Hashable {
        var user: User?
    }
    
    init(service: AuthService) {
        state = State()
        self.service = service
    }
}
