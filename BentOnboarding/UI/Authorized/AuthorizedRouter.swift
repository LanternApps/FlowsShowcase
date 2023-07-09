//
//  AuthorizedRouter.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import SharedCore
import SwiftUI

enum AuthorizedRoutes: Routes {
    case main(Void)
}

struct AuthorizedRouter {
    @ObservedObject var appState: AppState
    
    let routes: AuthorizedRoutes
    
    @ViewBuilder
    func configure() -> some View {
        switch routes {
        case .main: MainView()
        }
    }
}
