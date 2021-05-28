//
//  GoogleSignInButtonStyle.swift
//  pager
//
//  Created by Aleksandr Sidorov on 26.05.2021.
//

import SwiftUI

struct GoogleSignInButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {

        Rectangle()
            .fill(Color.clear)
            .overlay(
                HStack(alignment: .center, spacing: 8) {
                    Text(Image.googleLogo)
                    Text("Вход для роботов")
                        .font(.text)
                        .foregroundColor(.primaryDark)
                }
            )
            .frame(height: 48)
            .cornerRadius(3.0, corners: .allCorners, strokeColor: .primaryDark)
            .opacity(configuration.isPressed ? 0.3: 1)
    }
}

struct GoogleSignInButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}, label: {})
            .buttonStyle(GoogleSignInButtonStyle())
            .previewLayout(.sizeThatFits)
    }
}
