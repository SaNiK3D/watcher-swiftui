//
//  UtilizationProjectsEndpoint.swift
//  ApiClient
//
//  Created by Nikolay Zhukov on 6/8/20.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

private struct UtilizationProjectResponse: Decodable {
    let projects: [UtilizationProject]
}

/// Получение набора инструкций
public final class UtilizationProjectsEndpoint: Endpoint {
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Types
    
    public typealias Response = [UtilizationProject]

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let urlRequest = try requestBuilder.buildGETRequest(
            endpoint: "utilization-projects/"
        )
        return urlRequest
    }

    /// Парсит успешный ответ от сервера
    ///
    /// - Parameter response: Ответ от сервера в виде Data
    /// - Returns: Массив объектов `UtilizationProject`
    public func parse(response: Data) throws -> [UtilizationProject] {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try jsonDecoder.decode(APIResponse<UtilizationProjectResponse>.self, from: response)
        return response.data.projects
    }
    
}
