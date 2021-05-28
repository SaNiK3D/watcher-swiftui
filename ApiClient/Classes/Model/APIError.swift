//
//  APIError.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 22/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Ошибка API.
public struct APIError: Decodable, Error {

    /// Код ошибки.
    public struct Code: RawRepresentable, Decodable, Equatable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }

        public init(_ rawValue: String) {
            self.rawValue = rawValue
        }
    }

    /// Код ошибки.
    public let code: Code
    
    public init(code: Code) {
        self.code = code
    }
}

extension APIError: LocalizedError {
    
    public var errorDescription: String? {
        switch self.code {
        case .serverError:
            return NSLocalizedString("Server error", comment: "Ошибка на сервере")
        case .notFoundError:
            return NSLocalizedString("User not found", comment: "Пользователь с данным email не существует")
        case .validationError:
            return NSLocalizedString("Validation error", comment: "Ошибка валидации")
        case .internalError:
            return NSLocalizedString("Internal error", comment: "Внутреняя ошибка")
        case .expiredResetTokenError:
            return NSLocalizedString(
                "Reset token expired",
                comment: "Время жизни ссылки истекло. Запросите ссылку на восстановление пароля еще раз")
        case .userNotFoundError:
            return NSLocalizedString(
                "User not found",
                comment: "Пользователь с данным email не существует")
        case .invalidResetTokenError:
            return NSLocalizedString(
                "Invalid reset token",
                comment: "Что-то пошло не так. Запросите ссылку на восстановление пароля еще раз")
        case .authenticationRequiredError:
            return NSLocalizedString("Authentication Required", comment: "Для просмотра требуется авторизация")
        default:
            return nil
        }
    }
}

// MARK: - General Error Codes

extension APIError.Code {

    /// Ошибка валидации.
    public static let validationError = APIError.Code("validation_error")
    
    /// Объект не найден.
    public static let notFoundError = APIError.Code("not_found")
    
    /// Общая ошибка сервера
    public static let serverError = APIError.Code("server_error")
    
    /// Общая внутренняя ошибка
    public static let internalError = APIError.Code("internal_error")
    
    /// Токен истек
    public static let expiredResetTokenError = APIError.Code("expired_reset_token")
    
    /// Токен невалидный
    public static let invalidResetTokenError = APIError.Code("invalid_reset_token")
    
}

// MARK: - Auth Error Code

extension APIError.Code {

    /// Требуется авторизация.
    public static let authenticationRequiredError = APIError.Code("authentication_required")
    
    /// Неверный логин или пароль.
    public static let invalidCredentials = APIError.Code("invalid_credentials")
    
    /// Пользователь не найден.
    public static let userNotFoundError = APIError.Code("user_not_found")
}
