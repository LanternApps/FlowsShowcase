//
//  EnterInviteCodeView.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import SwiftUI
import SharedUI

struct InviteCodeView: View {
    @ObservedObject var viewModel: AuthVM
    
    @FocusState private var focused: Bool
    @State private var code = ""
    
    @EnvironmentObject private var navigation: NavigationState
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        VStack {
            HStack { Spacer() }
            
            Text("Bent requires an invitation from an existing community to get started.")
                .multilineTextAlignment(.center)
                .font(.callout)
                .padding(.bottom)
            
            TextField("Enter your invite code",
                      text: $code,
                      prompt: Text("Enter your invite code").foregroundColor(Color(hex: 0xAEAEB2)))
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .frame(height: 56)
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .fill(Color(hex: 0x242426))
            )
            .padding(.horizontal, 20)
            .focused($focused)
            .padding(.bottom)
            
            Text("Don’t have an invite? [Learn what you can do.](https://www.getbent.app/terms-of-service)")
                .font(.caption2)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 60)
                .padding(.bottom, 25)
            
            Spacer()
            
            Button {
                navigation.unAuthorized.append(.letsGo(viewModel))
            } label: {
                Text("Next")
                
            }
            .foregroundColor(.accentColor)
            .buttonStyle(WideButtonStyle())
            .padding(.horizontal, 20)
            .padding(.bottom, 12)
        }
        .background(Color("SortaBlack"))
        .environment(\.openURL, OpenURLAction { url in
            openURL(url)
            return .handled
        })
        .navigationTitle("Enter your invite code")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            focused = true
        }.foregroundColor(Color("KindaWhite"))
    }
}

struct InviteCodeView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            InviteCodeView(viewModel: AuthVM(service: AuthService()))
        }.preferredColorScheme(.dark)
    }
}
