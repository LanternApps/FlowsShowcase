//
//  VerifyPhoneView.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import SwiftUI
import SharedUI

enum FocusField: Hashable {
    case oneField
    case twoField
    case threeField
    case fourField
}

struct VerifyPhoneView: View {
    
    @ObservedObject var viewModel: AuthVM
    var phone = "+1 (415) 123-4567."
    
    @State private var one = ""
    @State private var two = ""
    @State private var three = ""
    @State private var four = ""
    
    @FocusState private var focusedField: FocusField?
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var navigation: NavigationState
    
    var body: some View {
        VStack(spacing: .zero) {
            
            Text("Please enter the code we sent to \(phone)")
                .foregroundColor(Color("KindaWhite"))
                .padding(.vertical)
            
            fields
                .padding(40)
            
            HStack {
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Resend code")
                        .foregroundColor(.accentColor)
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            
            Spacer()
        }
        .background(Color("SortaBlack"))
        .navigationTitle("Verify your phone")
        .onAppear {
            focusedField = .oneField
        }
    }
}

private extension VerifyPhoneView {
    func fildsToEmpty() {
        one = ""
        two = ""
        three = ""
        four = ""
    }
    
    var fields: some View {
        HStack(spacing: 8) {
            Group {
                
                TextField("", text: $one)
                    .focused($focusedField, equals: .oneField)
                    .onChange(of: one) { newValue in
                        if one.count == 1 {
                            focusedField = .twoField
                        }
                        if newValue.count == 4 {
                            one = newValue[0]
                            two = newValue[1]
                            three = newValue[2]
                            four = newValue[3]
                        }
                        guard !one.isEmpty && !two.isEmpty && !three.isEmpty && !four.isEmpty else { return }
                        
                        //TODO: trigger action
                        goToRoot()
                    }
                    .frame(width: 46, height: 72)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(
                        focusedField == .oneField ? Color.accentColor : .white,
                        style: StrokeStyle(lineWidth: 2.0))
                    )
                
                TextField("", text: $two)
                    .focused($focusedField, equals: .twoField)
                    .onChange(of: two) { newValue in
                        if two.count == 1 {
                            focusedField = .threeField
                        }
                        if newValue.count == 4 {
                            one = newValue[0]
                            two = newValue[1]
                            three = newValue[2]
                            four = newValue[3]
                        }
                        guard !one.isEmpty && !two.isEmpty && !three.isEmpty && !four.isEmpty else { return }
                        
                        //TODO: trigger action
                        goToRoot()
                    }
                    .frame(width: 46, height: 72)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(
                        focusedField == .twoField ? Color.accentColor : .white,
                        style: StrokeStyle(lineWidth: 2.0))
                    )
                
                TextField("", text: $three)
                    .focused($focusedField, equals: .threeField)
                    .onChange(of: three) { newValue in
                        if three.count == 1 {
                            focusedField = .fourField
                        }
                        if newValue.count == 4 {
                            one = newValue[0]
                            two = newValue[1]
                            three = newValue[2]
                            four = newValue[3]
                        }
                        guard !one.isEmpty && !two.isEmpty && !three.isEmpty && !four.isEmpty else { return }
                        
                        //TODO: trigger action
                        goToRoot()
                    }
                    .frame(width: 46, height: 72)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(
                        focusedField == .threeField ? Color.accentColor : .white,
                        style: StrokeStyle(lineWidth: 2.0))
                    )
                
                TextField("", text: $four)
                    .focused($focusedField, equals: .fourField)
                    .onChange(of: four) { newValue in
                        if newValue.count == 4 {
                            
                            one = newValue[0]
                            two = newValue[1]
                            three = newValue[2]
                            four = newValue[3]
                        }
                        guard !one.isEmpty && !two.isEmpty && !three.isEmpty && !four.isEmpty else { return }
                        
                        //TODO: trigger action
                        goToRoot()
                    }
                    .frame(width: 46, height: 72)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(
                        focusedField == .fourField ? Color.accentColor : .white,
                        style: StrokeStyle(lineWidth: 2.0))
                    )
            }
            .font(.title2)
            .bold()
            .keyboardType(.numberPad)
            .textContentType(.oneTimeCode)
            .multilineTextAlignment(.center)
            .background(Color("SortaBlack"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(Color("KindaWhite"))
        }
    }
    
    func goToRoot() {
        navigation.unAuthorized.removeAll()
        appState.onUserValid.send()
    }
}

struct VerificationView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VerifyPhoneView(viewModel: AuthVM(service: AuthService()))
                .environmentObject(AppState())
        }.preferredColorScheme(.dark)
    }
}
