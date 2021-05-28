//
//  CalendarEndpoint.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 25/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

private struct CalendarData: Decodable {
    let days: [Day]
}

/// Конечная точка API для работы с производственным календарем
public final class CalendarEndpoint: Endpoint {

    // MARK: - Types

    public typealias Response = [Day]

    // MARK: - Private Properties

    private let from: String
    private let to: String

    // MARK: - Initializers

    public init(from: String, to: String) {
        self.from = from
        self.to = to
    }

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let urlRequest = try requestBuilder.buildGETRequest(
            endpoint: "calendar",
            queryParams: ["from": from, "to": to]
        )
        return urlRequest
    }

    public func parse(response: Data) throws -> [Day] {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .custom(WatcherDateDecodingStrategy.decode)
        let response = try jsonDecoder.decode(APIResponse<CalendarData>.self, from: response)
        return response.data.days
    }
}
