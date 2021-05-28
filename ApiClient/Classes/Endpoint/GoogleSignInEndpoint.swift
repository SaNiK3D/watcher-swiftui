//
//  GoogleSigninEndpoint.swift
//  ApiClient
//
//  Created by Artem Garmash on 28/05/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Конечная точка API для авторизации пользователя через Google аккаунт
public final class GoogleSignInEndpoint: Endpoint {
    
    // MARK: - Types
    
    public typealias Response = Void
    
    // MARK: - Private Properties
    
    private let credentials: GoogleSignInCredentials
    
    // MARK: - Initializers
    
    public init(with credentials: GoogleSignInCredentials) {
        self.credentials = credentials
    }
    
    // MARK: - Public methods
    
    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        let jsonData = try jsonEncoder.encode(credentials)
        let urlRequest = requestBuilder.buildRequest(
            endpoint: "auth/google-login/",
            httpMethod: .post,
            jsonData: jsonData)
        return urlRequest
    }
    
    public func parse(response: Data) throws {}
}
