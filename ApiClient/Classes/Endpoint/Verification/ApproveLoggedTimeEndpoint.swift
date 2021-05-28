//
//  ApproveLoggedTimeEndpoint.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 21.05.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

private struct LoggedTimeData: Decodable {
    let loggedTime: LoggedTime
}

/// Верифицировать списанное время
public final class ApproveLoggedTimeEndpoint: Endpoint {

    // MARK: - Types

    public typealias Response = LoggedTime

    // MARK: - Private Properties

    private let loggedTimeId: Int

    // MARK: - Initializers

    public init(loggedTimeId: Int) {
        self.loggedTimeId = loggedTimeId
    }

    // MARK: - Public Methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        var endpoint = "logged-time/"
        endpoint += "\(loggedTimeId)/"
        endpoint += "approve"

        let urlRequest = requestBuilder.buildRequest(endpoint: endpoint, httpMethod: .post)
        return urlRequest
    }

    public func parse(response: Data) throws -> LoggedTime {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .custom(WatcherDateDecodingStrategy.decode)
        let response = try jsonDecoder.decode(APIResponse<LoggedTimeData>.self, from: response)
        return response.data.loggedTime
    }

}
