//
//  ChangePasswordEndpoint.swift
//  ApiClient
//
//  Created by Nikolay Zhukov on 6/9/20.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Изменение пароля
public final class ChangePasswordEndpoint: Endpoint {

    // MARK: - Types

    public typealias Response = Void

    // MARK: - Private Properties

    private let newPassword: NewPassword

    // MARK: - Initializers

    public init(_ newPassword: NewPassword) {
        self.newPassword = newPassword
    }

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        let jsonData = try jsonEncoder.encode(newPassword)
        let urlRequest = requestBuilder.buildRequest(
            endpoint: "auth/change-password/",
            httpMethod: .post,
            jsonData: jsonData
        )
        return urlRequest
    }

    public func parse(response: Data) throws {}
}
