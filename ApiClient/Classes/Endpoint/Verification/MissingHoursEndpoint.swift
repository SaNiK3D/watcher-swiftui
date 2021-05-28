//
//  MissingHoursEndpoint.swift
//  ApiClient
//
//  Created by Тимофей Забалуев on 21.04.2020.
//  Copyright © 2020 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Получить количество несписанных часов по дням.
public final class MissingHoursEndpoint: Endpoint {
    
    private let from: String?
    private let to: String?
    
    // MARK: - Initializers
    
    public init(from: String? = nil, to: String? = nil) {
        self.from = from
        self.to = to
    }
    
    public typealias Response = MissingHoursList
    
    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let queryParams = [
            "from": from,
            "to": to
        ]
        let urlRequest = try requestBuilder.buildGETRequest(endpoint: "logged-time/debts", queryParams: queryParams)
        return urlRequest
    }
    
    public func parse(response: Data) throws -> MissingHoursList {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .custom(WatcherDateDecodingStrategy.decode)
        let response = try jsonDecoder.decode(APIResponse<MissingHoursList>.self, from: response)
        return response.data
    }
}
