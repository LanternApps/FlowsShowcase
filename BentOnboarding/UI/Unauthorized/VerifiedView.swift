//
//  VerifiedView.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import SwiftUI

struct VerifiedView: View {
    @ObservedObject var viewModel: AuthVM
    
    let completion: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Spacer()
                Image("LogoText")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60)
                Spacer()
            }
            
            Text("Verified!")
                .font(.title)
                .bold()
                .padding(.vertical)
                .padding(.horizontal)
            
            Text("Your profile's almost ready.")
                .padding(.horizontal)
            
            Spacer()
            
            Image("Verified")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal,72)
            
            Spacer()

            bottom
        }
        .background(Color("SortaBlack"))
        .toolbar(.hidden)
    }
}

extension VerifiedView {
    
    var bottom: some View {
        VStack(spacing: 8) {
            Button {
                completion()
            } label: {
                Text("Next")
            }
            .foregroundColor(.accentColor)
            .buttonStyle(WideButtonStyle())
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

struct VerifiedView_Preview: PreviewProvider {
    static var previews: some View {
        VerifiedView(viewModel: AuthVM(service: AuthService())) { }
            .preferredColorScheme(.dark)
    }
}
