//
//  ProjectReportEndpoint.swift
//  ApiClient
//
//  Created by z.samarskaya on 18.08.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

struct ProjectReportData: Decodable {
    let report: [ProjectReport]
}

/// Конечная точка API для работы с отчетами по проектам
public final class ProjectReportEndpoint: Endpoint {
        
    // MARK: - Types
    
    public typealias Response = [ProjectReport]
    
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
        let queryParams = [
            "from": from,
            "to": to
        ]
        let urlRequest = try requestBuilder.buildGETRequest(
            endpoint: "reports/projects/",
            queryParams: queryParams
        )
        return urlRequest
    }
    
    /// Парсит успешный ответ от сервера
    ///
    /// - Parameter response: Ответ от сервера в виде Data
    /// - Returns: Массив объектов Project
    public func parse(response: Data) throws -> [ProjectReport] {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try jsonDecoder.decode(APIResponse<ProjectReportData>.self, from: response)
        return response.data.report
    }
}
