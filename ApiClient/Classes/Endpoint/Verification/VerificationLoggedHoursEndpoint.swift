//
//  VerificationLoggedHoursEndpoint.swift
//  ApiClient
//
//  Created by Тимофей Забалуев on 21.04.2020.
//

import Foundation

private struct LoggedTimeData: Decodable {
    let loggedTime: [LoggedTime]
}

/// Получить список списанных часов
public final class VerificationLoggedHoursEndpoint: Endpoint {

    // MARK: - Types

    public typealias Response = [LoggedTime]

    // MARK: - Private Properties
    
    private let from: String?
    private let to: String?
    private let departmentIds: [Int]?
    private let managed: Bool?
    private let status: LoggedTimeStatus?
    
    // MARK: - Initializers
    
    public init(
        from: String? = nil,
        to: String? = nil,
        departmentIds: [Int]? = nil,
        managed: Bool? = nil,
        status: LoggedTimeStatus? = nil) {
        
        self.from = from
        self.to = to
        self.departmentIds = departmentIds
        self.managed = managed
        self.status = status
    }
    
    // MARK: - Public Methods
    
    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let queryParams = [
            "from": from,
            "to": to,
            "managed": managed?.description,
            "status": status?.rawValue
        ]
        let urlRequest = try requestBuilder.buildGETRequest(endpoint: "logged-time", queryParams: queryParams)
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
