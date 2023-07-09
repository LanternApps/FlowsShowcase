//
//  WelcomeView.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    @ObservedObject var viewModel: AuthVM
    
    @State private var focused = true
    @State private var mobile = Locale.current.identifier == "en_US" ? "" : "+"
    @State private var code = ""
    
    @EnvironmentObject private var navigation: NavigationState
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        VStack {
            HStack { Spacer() }
            
            Spacer()
            
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal,72)
            
            Text("Queer Communities")
                .foregroundColor(Color("KindaWhite"))
                .bold()
                .font(.title3)
                .padding(.top)
            
            Spacer()
            
            bottom
            
            buttons
            
        }
        .background(Color("SortaBlack"))
        .toolbar(.hidden)
        .environment(\.openURL, OpenURLAction { url in
            openURL(url)
            return .handled
        })
    }
}

extension WelcomeView {
    
    var bottom: some View {
        VStack {
            Text(
                """
By tapping sign up, I agree I’m 18 or older, and to the [Terms of Service](https://www.getbent.app/terms-of-service) & [Privacy Policy](https://www.getbent.app/terms-of-service)
"""
            )
            .font(.caption2)
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 60)
            .padding(.bottom, 25)
            
        }
    }
    
    var buttons: some View {
        VStack(spacing: 8) {
            Button {
                navigation.unAuthorized.append(.enterInviteCode(viewModel))
            } label: {
                Text("Sign Up")
            }
            .foregroundColor(.accentColor)
            .buttonStyle(WideButtonStyle())
            
            Button {
                
            } label: {
                Text("Log in")
                    .frame(height: 49)
                    .padding(.horizontal, 60)
            }
        }
        
        .padding(.horizontal, 20)
    }
}

struct WelcomeView_Preview: PreviewProvider {
    static var previews: some View {
        WelcomeView(viewModel: AuthVM(service: AuthService()))
            .preferredColorScheme(.dark)
    }
}
