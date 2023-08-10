//
//  BentOnboardingApp.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import SwiftUI
import SharedUI
import SharedCore
import SwiftUIFlows

@main
struct BentOnboardingApp: App {
    @State private var reachability = try? Reachability()
    
    @StateObject private var flow = RootFlow(isPresented: .constant(true))
    @StateObject private var navigation = NavigationState()
    
    @StateObject private var appState: AppState
    @StateObject private var authVM: AuthVM
    
    init() {
        let appState = AppState()
        
        _appState = StateObject(wrappedValue: appState)
        _authVM = StateObject(wrappedValue: AuthVM(service: AuthService()))
        
        reachability?.whenUnreachable = { _ in
            appState.onAlertMessage.send("No Internet Connection")
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        if appState.user != nil {
            MainView()
        } else {
            WelcomeView(viewModel: authVM)
        }
    }
    
    var navigationStack: some View {
        NavigationStack(path: $navigation.unAuthorized) {
            contentView.navigationDestination(for: UnauthorizedRoutes.self) { route in
                UnauthorizedRouter(appState: appState, routes: route).configure()
            }
        }
        .environmentObject(appState)
        .environmentObject(navigation)
    }
    
    var body: some Scene {
        WindowGroup {
            navigationStack
                .preferredColorScheme(.dark)
                .onReceive(appState.onUserValid) { _ in
                    Task {
                        await flow.showVerified(viewModel: authVM)
                        try? await Task.sleep(for: .seconds(0.4))
                    }
                }
                .environmentObject(navigation)
                .fullScreenFlow(flow)
                .onReceive(appState.onResignFirstResponder) {
                    UIApplication.shared.key?.resignFirstResponder()
                    UIApplication.shared.key?.endEditing(true)
                }
                .onAppear {
                    try? reachability?.startNotifier()
                    NetworkLogger.register()
                }
                .onDisappear {
                    reachability?.stopNotifier()
                }
        }
    }
}
