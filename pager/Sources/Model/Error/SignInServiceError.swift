//
//  SignInServiceError.swift
//  pager
//
//  Created by Aleksandr Sidorov on 27.05.2021.
//

import ApiClient
import Foundation

enum SignInServiceError: Error {
    case emailIsInvalid
    case emailOrPasswordIsInvalid
}

extension SignInServiceError {
    init?(with apiError: APIError) {
        switch apiError.code {
        case .validationError:
            self = .emailIsInvalid
        case .invalidCredentials:
            self = .emailOrPasswordIsInvalid
        default:
            return nil
        }
    }
}

extension SignInServiceError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .emailIsInvalid:
            return NSLocalizedString("Invalid email format", comment: "Неверный формат email")
        case .emailOrPasswordIsInvalid:
            return NSLocalizedString("Invalid email or password", comment: "Неверный email или пароль")
        }
    }

}
