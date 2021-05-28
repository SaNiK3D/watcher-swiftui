//
//  WaitingForApprovalEndpoint.swift
//  ApiClient
//
//  Created by Nikolay Zhukov on 6/23/20.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

private struct WaitingForApprovalResponse: Decodable {
    let allHours: Double
}

/// Получить количество времени которое осталось заапрувить.
public final class WaitingForApprovalEndpoint: Endpoint {
    
    // MARK: - Types

    public typealias Response = Double
    
    // MARK: - Initialization
    
    public init() { }
    
    // MARK: - Public Methods
    
    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let urlRequest = try requestBuilder.buildGETRequest(endpoint: "logged-time/waiting-for-approval")
        return urlRequest
    }
    
    public func parse(response: Data) throws -> Double {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .custom(WatcherDateDecodingStrategy.decode)
        let response = try jsonDecoder.decode(APIResponse<WaitingForApprovalResponse>.self, from: response)
        return response.data.allHours
    }
}
