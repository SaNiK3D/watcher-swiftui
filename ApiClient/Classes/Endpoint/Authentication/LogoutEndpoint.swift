//
//  LogoutEndpoint.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 15.07.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Конечная точка для деавторизации пользователя
public final class LogoutEndpoint: Endpoint {

    // MARK: - Types

    public typealias Response = Void

    // MARK: - Initializers

    public init() {}

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let urlRequest = requestBuilder.buildRequest(
            endpoint: "auth/logout/",
            httpMethod: .post
        )
        return urlRequest
    }

    public func parse(response: Data) throws {}
}
