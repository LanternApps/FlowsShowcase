//
//  ButtonStyles.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import SwiftUI

struct WideButtonStyle: ButtonStyle {
    
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.subheadline)
                .bold()
                .foregroundColor(Color("SortaBlack"))
                .frame(maxWidth: .infinity, minHeight: 49)
                .background(Color.accentColor)
                .cornerRadius(14)
        }
    }
