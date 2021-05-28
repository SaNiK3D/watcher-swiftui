//
//  GoogleAuthenticator.swift
//  pager
//
//  Created by Aleksandr Sidorov on 24.05.2021.
//

import Combine
import Foundation
import GoogleSignIn

/// Обертка над библиотекой авторизации Google
final class GoogleAuthenticator: NSObject {
    
    // MARK: - Types
    
    typealias IdToken = String

    // MARK: - Private Properties

    private var tokenSubject = PassthroughSubject<IdToken, Error>()
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        
        GIDSignIn.sharedInstance()?.clientID =
            "698901875505-2p5bv3n1noc234u2i1venvfdh1aannrc.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.hostedDomain = "redmadrobot.com"
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    // MARK: - Public methods
    
    /// Инициирует процесс авторизации через Google
    ///
    func signIn(presenter: UIViewController) -> AnyPublisher<IdToken, Error> {
        GIDSignIn.sharedInstance()?.presentingViewController = presenter
        GIDSignIn.sharedInstance()?.signIn()
        
        tokenSubject = PassthroughSubject<IdToken, Error>()
        return tokenSubject.eraseToAnyPublisher()
    }

    func checkGoogleSignIn() -> Bool {
        GIDSignIn.sharedInstance()?.currentUser != nil
    }
    
    /// Выполняет деавторизацию из Google
    static func signOut() {
        GIDSignIn.sharedInstance()?.signOut()
    }
    
    // MARK: - Private Methods
    
    private func shouldProceedError(_ error: Error) -> Bool {
        (error as NSError).code != GIDSignInErrorCode.canceled.rawValue
    }
}

extension GoogleAuthenticator: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        guard error == nil else {
            if self.shouldProceedError(error) {
                tokenSubject.send(completion: .failure(error))
            }
            return
        }
        
        guard let idToken = user.authentication.idToken else {
            tokenSubject.send(completion: .failure(GoogleAuthenticatorError.unknownError))
            return
        }
        
        tokenSubject.send(idToken)
        tokenSubject.send(completion: .finished)
    }
}

enum GoogleAuthenticatorError: Error {
    case unknownError
}

extension GoogleAuthenticatorError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unknownError:
            return NSLocalizedString(
                "Unknown error occured during Google sign in",
                comment: "Неизвестная ошибка при авторизации через Google")
        }
    }
}

