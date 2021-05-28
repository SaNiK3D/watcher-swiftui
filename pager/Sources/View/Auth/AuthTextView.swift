//
//  AuthTextView.swift
//  pager
//
//  Created by Aleksandr Sidorov on 26.05.2021.
//

import SwiftUI

struct AuthTextView: View {
    let title: String
    let image: Image
    let formatter: Formatter
    
    let onEditingChanged: (Bool) -> Void
    let onCommit: () -> Void
    let onImageTap: () -> Void
    
    private var outputText: Binding<String>
    
    init(
        title: String,
        image: Image,
        formatter: Formatter,
        outputText: Binding<String>,
        onEditingChanged: @escaping (Bool) -> Void = { _ in },
        onCommit: @escaping () -> Void = {},
        onImageTap: @escaping () -> Void = {}) {
        
        self.title = title
        self.image = image
        self.formatter = formatter
        self.onEditingChanged = onEditingChanged
        self.onCommit = onCommit
        self.onImageTap = onImageTap
        self.outputText = outputText
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.text)
                .foregroundColor(.greyText)
                .lineLimit(2)
            HStack {
                TextField(
                    "",
                    text: outputText,
                    onEditingChanged: onEditingChanged,
                    onCommit: onCommit
                )
                .padding(.horizontal, 10)
                
                Button(action: onImageTap, label: { image })
                
                Spacer(minLength: 12)
            }
            .frame(height: 48)
            .cornerRadius(4.0, strokeColor: Color.greyDisabled)
        }
    }
}

struct AuthTextView_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextView(
            title: "E-mail для аутстаферов",
            image: Image.icnUser,
            formatter: EmailFormatter(),
            outputText: Binding<String>(
                get: { "" },
                set: { _ in })
        )
        .previewLayout(.sizeThatFits)
    }
}
