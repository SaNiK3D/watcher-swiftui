//
//  SignInView.swift
//  pager
//
//  Created by Aleksandr Sidorov on 24.05.2021.
//

import SwiftUI

struct SignInView: View {
    
    private enum Padding {
        static let horizontal: CGFloat = 16
    }
    
    @ObservedObject var viewModel: SignInViewModel
    @StateObject
        private var windowObserver: WindowObserver = WindowObserver()
    
    @State private var isButtonEnabled: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            
            Text("WATCHER")
                .font(.headline20)
            
            Button(
                action: {
                    viewModel.startGoogleSignIn(
                        presenter: windowObserver.window?.rootViewController)
                },
                label: {}
            )
            .buttonStyle(GoogleSignInButtonStyle())
            
            ZStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(.greyDisabled)
                    .frame(height: 1)
                Text("или")
                    .font(.text)
                    .lineLimit(1)
                    .background(
                        GeometryReader { geometry in
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(
                                    width: geometry.size.width + 8)
                                .position(
                                    x: geometry.size.width / 2,
                                    y: geometry.size.height / 2)
                        }
                    )
            }
            .padding(.vertical, 8)
            
            AuthTextView(
                title: "E-mail для аутстаферов",
                image: Image.icnUser,
                formatter: EmailFormatter(),
                outputText: $viewModel.email)

            AuthTextView(
                title: "Пароль",
                image: Image.icnEyes,
                formatter: EmailFormatter(),
                outputText: $viewModel.password)
            
            Spacer()
            
            PrimaryButton(title: "Войти", action: {}, isEnabled: isButtonEnabled)
                .onReceive(viewModel.isButtonEnabled) { isButtonEnabled in
                    self.isButtonEnabled = isButtonEnabled
                }
                .animation(.none)
            
            Button(action: {}) {
                Text("Забыли пароль?")
                    .font(.text)
                    .foregroundColor(.primaryDark)
                    .background(
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                    )
            }
            
            Spacer()
            
            HyperlinkedText(text: viewModel.helpText, didTapUrl: { _ in print("TAp") })
                .frame(height: 60)
                .padding(.bottom, 24)
                
        }
        .overlay(
            Group {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
        )
        .padding([.horizontal], Padding.horizontal)
        .padding(.vertical, 16)
        .withHostingWindow {
            windowObserver.window = $0
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInView(viewModel: SignInViewModel(didSignIn: { }))
        }
    }
}
