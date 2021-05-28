//
//  SignInViewModel.swift
//  pager
//
//  Created by Aleksandr Sidorov on 25.05.2021.
//

import Combine
import UIKit
import SwiftUI

final class SignInViewModel: ObservableObject {
    
    let helpText: String = "Если возникли сложности при работе с Watcher, или есть предложения по улучшению, пишите на watcher_support@redmadrobot.com"
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    lazy var isButtonEnabled: AnyPublisher<Bool, Never> = {
        $email.dropFirst()
            .combineLatest($password.dropFirst()) { (email: $0, password: $1) }
            .map { !$0.email.isEmpty && !$0.password.isEmpty }
            .eraseToAnyPublisher()
    }()
    
    @Published private(set) var isLoading = false
    
    private let googleAuthenticator: GoogleAuthenticator
    private let tokenStorage: AuthTokenStorage
    private let signInService: SignInServiceProtocol
    
    private let didSignIn: () -> Void
    
    private var isButtonEnabledCancellable: AnyCancellable?
    private var authCancellable: AnyCancellable?
    
    init(googleAuthenticator: GoogleAuthenticator = GoogleAuthenticator(),
         tokenStorage: AuthTokenStorage = ServiceLayer.shared.tokenStorage,
         signInService: SignInServiceProtocol = ServiceLayer.shared.signInService,
         didSignIn: @escaping () -> Void) {
        
        self.googleAuthenticator = googleAuthenticator
        self.tokenStorage = tokenStorage
        self.signInService = signInService
        
        self.didSignIn = didSignIn
        
        isButtonEnabledCancellable = isButtonEnabled
            .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })
    }
    
    func startGoogleSignIn(presenter: UIViewController?) {
        guard let presenter = presenter else {
            return
        }
        
        authCancellable?.cancel()
        
        authCancellable = googleAuthenticator.signIn(presenter: presenter)
            .flatMap { [signInService] idToken in
                return signInService.signIn(withGoogleCredentials: GoogleSignInCredentials(idToken: idToken))
            }
            .tryMap { [tokenStorage] token in
                try tokenStorage.saveToken(token)
            }
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        print(error.localizedDescription)
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] in
                    self?.didSignIn()
                }
            )
    }
}
