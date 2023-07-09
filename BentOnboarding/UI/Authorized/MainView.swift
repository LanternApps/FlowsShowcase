//
//  MainView.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import SwiftUI

struct MainView: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        VStack {
            HStack { Spacer() }
            Spacer()
        }.navigationTitle("Main View")
    }
}

#if DEBUG

struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppState())
    }
}

#endif
