//
//  ProfileEndPoint.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 10.06.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

private struct ProfileResponse: Decodable {
    let profile: Profile
}

/// Получение профиля
public final class ProfileEndPoint: Endpoint {

    // MARK: - Initializers

    public init() {}

    // MARK: - Types

    public typealias Response = Profile

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let urlRequest = try requestBuilder.buildGETRequest(
            endpoint: "auth/profile/"
        )
        return urlRequest
    }

    /// Парсит успешный ответ от сервера
    ///
    /// - Parameter response: Ответ от сервера в виде Data
    /// - Returns: объекта типа 'Profile'
    public func parse(response: Data) throws -> Profile {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .custom(WatcherDateDecodingStrategy.decode)
        let response = try jsonDecoder.decode(APIResponse<ProfileResponse>.self, from: response)
        return response.data.profile
    }

}
