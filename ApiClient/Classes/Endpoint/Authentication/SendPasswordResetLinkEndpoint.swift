//
//  UserEndpoint.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 16/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Запрос ссылки на восстановление пароля
public final class SendPasswordResetLinkEndpoint: Endpoint, Encodable {

    // MARK: - Types

    public typealias Response = Void

    // MARK: - Private Properties

    private let email: String

    // MARK: - Initializers

    public init(_ email: String) {
        self.email = email
    }

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(self)
        let urlRequest = requestBuilder.buildRequest(
            endpoint: "auth/send-password-reset-link/",
            httpMethod: .post,
            jsonData: jsonData
        )
        return urlRequest
    }

    public func parse(response: Data) throws {}
}
