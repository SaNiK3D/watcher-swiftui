//
//  RejectLoggedTimeListEndpoint.swift
//  ApiClient
//
//  Created by Nikolay Zhukov on 6/26/20.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

private struct LoggedTimeData: Decodable {
    let loggedTime: [LoggedTime]
}

/// Верифицировать списанное время списком
public final class RejectLoggedTimeListEndpoint: Endpoint, Encodable {

    // MARK: - Types

    public typealias Response = [LoggedTime]

    // MARK: - Private Properties

    private let loggedTimeIds: String
    private let comment: String

    // MARK: - Initialization

    public init(
        loggedTimeIds: String, comment: String) {
        self.loggedTimeIds = loggedTimeIds
        self.comment = comment
    }

    // MARK: - Public Methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let jsonData = try encoder.encode(self)
        let urlRequest = requestBuilder.buildRequest(
            endpoint: "logged-time/bulk/reject",
            httpMethod: .post,
            jsonData: jsonData)

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
