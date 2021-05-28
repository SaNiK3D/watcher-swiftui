//
//  AuthenticationService.swift
//  pager
//
//  Created by Aleksandr Sidorov on 27.05.2021.
//

import ApiClient
import Combine
import Foundation

protocol SignInServiceProtocol {
    typealias AuthToken = String

    /// Производит аутентификацию с логином и паролем
    ///
    /// - Parameters:
    ///   - credentials: Объект SignInCredentials содержащий email и пароль
    ///   - completion: Возвращает токен авторизации в виде Result
    func signIn(withCredentials credentials: SignInCredentials) -> Future<AuthToken, Error>

    /// Производит аутентификацию с токеном, полученным при Google авторизации
    ///
    /// - Parameters:
    ///   - credentials: Объект SignInCredentials содержащий email и пароль
    ///   - completion: Возвращает токен авторизации в виде Result
    func signIn(withGoogleCredentials credentials: GoogleSignInCredentials) -> Future<AuthToken, Error>
}

final class SignInService: SignInServiceProtocol {
    
    private let client: ApiClient

    init(client: ApiClient) {
        self.client = client
    }

    func signIn(withCredentials credentials: SignInCredentials) -> Future<AuthToken, Error> {
        let request = SignInEndpoint(credentials: credentials)
        return performRequest(with: request)
    }
    
    func signIn(withGoogleCredentials credentials: GoogleSignInCredentials) -> Future<AuthToken, Error> {
        
        let request = GoogleSignInEndpoint(with: credentials)
        return performRequest(with: request)
    }
    
    func performRequest<Request>(with request: Request) -> Future<AuthToken, Error> where Request: Endpoint {
        
        return .init { [client] promise in
            client.request(with: request) { result, headers in
                switch result {
                case .failure(let error):
                    if let apiError = error as? APIError {
                        promise(.failure(SignInServiceError(with: apiError) ?? apiError))
                    } else {
                        promise(.failure(error))
                    }
                case .success:
                    if let headers = headers,
                        let accessToken = self.getAccessToken(from: headers) {
                        promise(.success(accessToken))
                    } else {
                        promise(.failure(APIError(code: .internalError)))
                    }
                }
            }
        }
    }
    
    func getAccessToken(from headers: [AnyHashable: Any]) -> String? {
        guard let value = headers["Set-Cookie"] as? String else {
            // TODO: сервер не возвращает куки
            return ""
        }
        
        guard let regex = try? NSRegularExpression(pattern: "access_token=([^=]+);") else {
            return nil
        }
        
        let range = NSRange(location: 0, length: value.count)
        
        guard let match = regex.firstMatch(in: value, options: [], range: range) else {
            return nil
        }
        
        let accessTokenRange = match.range(at: 1)
        let stringRange = Range(accessTokenRange, in: value)!
        let accessToken = value[stringRange.lowerBound..<stringRange.upperBound]
        return String(accessToken)
    }
}
