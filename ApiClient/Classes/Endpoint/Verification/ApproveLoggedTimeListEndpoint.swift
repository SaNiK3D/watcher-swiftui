//
//  ApproveLoggedTimeListEndpoint.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 22.05.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

private struct LoggedTimeData: Decodable {
    let loggedTime: [LoggedTime]
}

/// Верифицировать списанное время списком
public final class ApproveLoggedTimeListEndpoint: Endpoint {

    // MARK: - Types

    public typealias Response = [LoggedTime]

    // MARK: - Private Properties

    private let loggedTimeListRequest: LoggedTimeListRequest

    // MARK: - Initializers

    public init(loggedTimeListRequest: LoggedTimeListRequest) {
        self.loggedTimeListRequest = loggedTimeListRequest
    }

    // MARK: - Public Methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        var endpoint = "logged-time/"
        endpoint += "bulk/"
        endpoint += "approve"

        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase

        let jsonData = try encoder.encode(loggedTimeListRequest)

        let urlRequest = requestBuilder.buildRequest(endpoint: endpoint, httpMethod: .post, jsonData: jsonData)

        return urlRequest
    }

    public func parse(response: Data) throws -> [LoggedTime] {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .custom(WatcherDateDecodingStrategy.decode)
        let response = try jsonDecoder.decode(APIResponse<LoggedTimeData>.self, from: response)
        return response.data.loggedTime
    }

}
