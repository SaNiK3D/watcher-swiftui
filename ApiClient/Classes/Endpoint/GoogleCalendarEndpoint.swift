//
//  GoogleCalendarEndpoint.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 23.06.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

private struct GoogleCalendareResponse: Decodable {
    let events: [Event]
}

/// Конечная точка API для получения событий из календаря
public final class GoogleCalendarEndpoint: Endpoint {

    // MARK: - Types

    public typealias Response = [Event]

    // MARK: - Private Properties

    private let from: String
    private let to: String?
    private let maxResult: String?

    // MARK: - Initializers

    public init(from: String, to: String? = nil, maxResult: String? = nil) {
        self.from = from
        self.to = to
        self.maxResult = maxResult
    }

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let urlRequest = try requestBuilder.buildGETRequest(
            endpoint: "google-calendar/events",
            queryParams: ["from": from, "to": to, "max_results": maxResult])
        return urlRequest
    }

    public func parse(response: Data) throws -> [Event] {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .custom(WatcherDateDecodingStrategy.decode)
        let response = try jsonDecoder.decode(APIResponse<GoogleCalendareResponse>.self, from: response)
        return response.data.events

    }

}
