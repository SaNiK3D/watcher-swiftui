//
//  RejectLoggedTimeEndpoint.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 22.05.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

private struct LoggedTimeData: Decodable {
    let loggedTime: LoggedTime
}

/// Отклонить списаннное время
public final class RejectLoggedTimeEndpoint: Endpoint {

    // MARK: - Types

    public typealias Response = LoggedTime

    // MARK: - Private Properties

    private let verificationRejectRequest: VerificationRejectRequest

    // MARK: - Initializers

    public init(loggedTimeId: Int, comment: String) {
        let verificationRejectRequest = VerificationRejectRequest(
            loggedTimeId: loggedTimeId,
            comment: Comment(text: comment, createdAt: Date()))
        self.verificationRejectRequest = verificationRejectRequest
    }

    // MARK: - Public Methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        var endpoint = "logged-time/"
        endpoint += "\(verificationRejectRequest.loggedTimeId)/"
        endpoint += "reject"

        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase

        let jsonData = try encoder.encode(verificationRejectRequest)

        let urlRequest = requestBuilder.buildRequest(endpoint: endpoint, httpMethod: .post, jsonData: jsonData)

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
