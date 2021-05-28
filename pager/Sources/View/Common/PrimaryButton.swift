//
//  PrimaryButton.swift
//  pager
//
//  Created by Aleksandr Sidorov on 26.05.2021.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    let title: String
    
    var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 3)
            .fill(isEnabled ? Color.charCoalGrey : Color.greyDisabled)
            .overlay(
                Text(title).foregroundColor(.white)
            )
            .opacity(!configuration.isPressed || !isEnabled ? 1.0 : 0.5)
    }
}

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var isEnabled: Bool
    
    var body: some View {
        Button(action: isEnabled ? action : {}) {}
            .buttonStyle(PrimaryButtonStyle(title: title, isEnabled: isEnabled))
            .frame(height: 48)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PrimaryButton(title: "Войти", action: {}, isEnabled: true)
            PrimaryButton(title: "Войти", action: {}, isEnabled: false)
        }
        .previewLayout(.fixed(width: 300, height: 48))
    }
}
