//
//  AddLoggedTimeEndpoint.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 17/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

private struct LoggedTimeData: Decodable {
    let loggedTime: LoggedTime
}

/// Конечная точка API для списания времени
public final class AddLoggedTimeEndpoint: Endpoint {

    // MARK: - Types
    
    public typealias Response = LoggedTime

    // MARK: - Private Properties

    private let logTimeRequest: LogTimeRequest
    
    // MARK: - Initializers

    public init(logTimeRequest: LogTimeRequest) {
        self.logTimeRequest = logTimeRequest
    }
    
    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .formatted(DateFormatter.watcherDefault)
        let jsonData = try encoder.encode(logTimeRequest)
        let urlRequest = requestBuilder.buildRequest(
            endpoint: "logged-time/",
            httpMethod: .post,
            jsonData: jsonData
        )
        return urlRequest
    }

    /// Парсит ответ от сервера
    ///
    /// - Parameter response: Ответ от сервера в виде Data
    /// - Returns: Объект LoggedTime
    public func parse(response: Data) throws -> LoggedTime {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .custom(WatcherDateDecodingStrategy.decode)
        let response = try jsonDecoder.decode(APIResponse<LoggedTimeData>.self, from: response)
        return response.data.loggedTime
    }

}
