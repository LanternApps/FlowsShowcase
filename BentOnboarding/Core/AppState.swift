//
//  AppState.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import Combine

class AppState: ObservableObject {

    @Published var user: User?

    /// Centralized Error Handling
    var onAlertMessage = PassthroughSubject<String, Never>()
    var onAlertError = PassthroughSubject<Error, Never>()

    /// Hides keyboard
    var onResignFirstResponder = PassthroughSubject<Void, Never>()
    
    var onUserValid = PassthroughSubject<Void, Never>()
    
    init() {
        
    }
}

class NavigationState: ObservableObject {
    @Published var unAuthorized: [UnauthorizedRoutes] = []
    @Published var authorized: [AuthorizedRoutes] = []
}
