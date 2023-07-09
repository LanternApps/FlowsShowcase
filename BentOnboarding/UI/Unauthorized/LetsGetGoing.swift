//
//  LetsGetGoing.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import SwiftUI
import SharedUI

struct LetsGetGoingView: View {
    @ObservedObject var viewModel: AuthVM
    
    @FocusState private var focused: Bool
    @State private var code = ""
    
    @EnvironmentObject private var navigation: NavigationState
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        VStack {
            HStack { Spacer() }
            
           Image("81members")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(12)
            
            Text("Let’s get your account set up so you’re ready to join Queer League Comics.")
                .font(.callout)
                .foregroundColor(Color("KindaWhite"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 35)
                .padding(.bottom, 25)
            
            Spacer()
            
            Button {
                navigation.unAuthorized.append(.createAccount(viewModel))
            } label: {
                Text("Next")
            }
            .foregroundColor(.accentColor)
            .buttonStyle(WideButtonStyle())
            .padding(.horizontal, 20)
            .padding(.bottom, 12)
        }
        .background(Color("SortaBlack"))

        .navigationTitle("Let's get going!")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            focused = true
        }.foregroundColor(Color("KindaWhite"))
    }
}

struct LetsGetGoingView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LetsGetGoingView(viewModel: AuthVM(service: AuthService()))
        }.preferredColorScheme(.dark)
    }
}
