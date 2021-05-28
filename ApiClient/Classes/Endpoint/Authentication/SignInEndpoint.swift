//
//  SignInEndpoint.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 16/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Конечная точка API для авторизации пользователя через учетную запись
public final class SignInEndpoint: Endpoint {

    // MARK: - Types

    public typealias Response = Void

    // MARK: - Private Properties

    private let credentials: SignInCredentials

    // MARK: - Initializers

    public init(credentials: SignInCredentials) {
        self.credentials = credentials
    }

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(credentials)
        let urlRequest = requestBuilder.buildRequest(
            endpoint: "auth/login/",
            httpMethod: .post,
            jsonData: jsonData
        )
        return urlRequest
    }

    public func parse(response: Data) throws {}
}
