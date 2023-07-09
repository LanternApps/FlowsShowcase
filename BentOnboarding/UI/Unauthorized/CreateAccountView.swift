//
//  CreateYourAccount.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import SwiftUI
import SharedUI

struct CreateAccountView: View {
    
    @ObservedObject var viewModel: AuthVM
    
    @FocusState private var focused: Bool
    @State private var code = "🇺🇸 +1"
    @State private var phone = ""
    @State private var email = ""
    @State private var birth = Date()
    
    @EnvironmentObject private var navigation: NavigationState
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
                phoneField
                
                emailField
                
                birthField
                
                Spacer()
                
                bottom
            }.frame(maxHeight: .infinity)
        }
        .background(Color("SortaBlack"))
        .environment(\.openURL, OpenURLAction { url in
            openURL(url)
            return .handled
        })
        .navigationTitle("Create your account")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            focused = true
        }.foregroundColor(Color("KindaWhite"))
    }
}

extension CreateAccountView {
    
    var phoneField: some View {
        VStack(spacing: 0) {
            HStack {
                
                Text("Phone Number")
                    .font(.callout)
                    .padding(.bottom)
                    .bold()
                Spacer()
            }
            
            HStack {
                TextField("+",
                          text: $code,
                          prompt: Text("+")
                )
                .frame(width: 56, height: 56)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 22)
                        .fill(Color(hex: 0x242426))
                )
                
                TextField("Enter your invite code",
                          text: $phone,
                          prompt: Text("(000) 000-0000").foregroundColor(Color(hex: 0xAEAEB2)))
                .keyboardType(.phonePad)
                .textContentType(.telephoneNumber)
                .frame(height: 56)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 22)
                        .fill(Color(hex: 0x242426))
                )
                .focused($focused)
            }
        }
        .foregroundColor(.white)
        .padding(.horizontal, 16)
        .padding(.bottom)
    }
    
    var emailField: some View {
        VStack(spacing: 0) {
            HStack {
                
                Text("Email")
                    .font(.callout)
                    .padding(.bottom)
                    .bold()
                Spacer()
            }
            
            TextField("Email",
                      text: $email,
                      prompt: Text("Email address").foregroundColor(Color(hex: 0xAEAEB2)))
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
            .frame(height: 56)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .fill(Color(hex: 0x242426))
            )
        }
        .padding(.horizontal, 16)
        .padding(.bottom)
    }
    
    var birthField: some View {
        DatePicker(selection: $birth, in: ...Date.now, displayedComponents: .date) {
            VStack {
                Text("Birthdate")
                    .font(.callout)
                    .bold()
                    .datePickerStyle(WheelDatePickerStyle())
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom)
    }
    
    var bottom: some View {
        VStack(spacing: 0) {
            Text("By continuing, you will receive a verification code from us. Messages and data rates apply. Your email will be used for marketing and important app updates. Your birthdate will be used to determine eligibility and to determine your age for your profile if you choose to make it visible.")
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.bottom)
            
            Button {
                navigation.unAuthorized.append(.verifyPhone(viewModel))
            } label: {
                Text("Next")
            }
            .foregroundColor(.accentColor)
            .buttonStyle(WideButtonStyle())
            .padding(.horizontal, 20)
            .padding(.bottom, 12)
        }
    }
}

struct CreateAccountView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateAccountView(viewModel: AuthVM(service: AuthService()))
        }.preferredColorScheme(.dark)
    }
}
