//
//  RootFlow.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import SwiftUI
import SharedUI
import SwiftUIFlows

@MainActor class RootFlow: FlowBuilder {
    
    func showVerified(viewModel: AuthVM) async {
        await presentFullScreen(
            VerifiedView(viewModel: viewModel, completion: { [weak self] in
                self?.dismissFullScreen()
            })
        )
    }
    
    /// We can show pretty much any overlay this way, only one shown at a time
    func showMoar(view: AnyView) async {
        await presentFullScreen(
            view
                .onAppear {
                    Task {
                        try? await Task.sleep(for: .seconds(2))
                        self.dismissFullScreen()
                    }
                }
        )
    }
}

