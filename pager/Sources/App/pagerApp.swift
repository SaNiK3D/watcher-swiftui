//
//  pagerApp.swift
//  pager
//
//  Created by Daniil Subbotin on 26.03.2021.
//

import UIKit
import SwiftUI

@main
struct pagerApp: App {
    
    @ObservedObject private var viewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if viewModel.isSplashShowing {
                    SplashView()
                        .onAppear(perform: viewModel.updateLoggedStatus)
                        .transition(.opacity)
                } else {
                    Group {
                        if !viewModel.isLogged {
                            SignInView(viewModel: SignInViewModel(didSignIn: viewModel.updateLoggedStatus))
                                .transition(.scale(scale: 1.5))
                        } else {
                            NavigationView {
                                ContentView()
                            }
                        }
                    }
                }
            }
            .animation(.easeOut(duration: 0.7))
        }
    }
}
