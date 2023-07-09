//
//  UnAuthorizedRouter.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import SharedCore
import SwiftUI

enum UnauthorizedRoutes: Routes {
    case welcome(AuthVM)
    case enterInviteCode(AuthVM)
    case letsGo(AuthVM)
    case createAccount(AuthVM)
    case verifyPhone(AuthVM)
}

struct UnauthorizedRouter {
    @ObservedObject var appState: AppState
    
    let routes: UnauthorizedRoutes
    
    @ViewBuilder
    func configure() -> some View {
        switch routes {
        case let .welcome(vm): WelcomeView(viewModel: vm)
        case let .letsGo(vm): LetsGetGoingView(viewModel: vm)
        case let .verifyPhone(vm): VerifyPhoneView(viewModel: vm)
        case let .enterInviteCode(vm): InviteCodeView(viewModel: vm)
        case let .createAccount(vm): CreateAccountView(viewModel: vm)
        }
    }
}
