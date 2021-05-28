//
//  MyProjectsEndpoint.swift
//  ApiClient
//
//  Created by Тимофей Забалуев on 29.04.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

private struct ProjectsData: Decodable {
    let projects: [MyProject]
}

/// Конечная точка API для работы с проектами
public final class MyProjectsEndpoint: Endpoint {
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Types
    
    public typealias Response = [MyProject]

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let queryParams = [
            "my_projects": "true"
        ]
        let urlRequest = try requestBuilder.buildGETRequest(
            endpoint: "projects/",
            queryParams: queryParams
        )
        return urlRequest
    }

    /// Парсит успешный ответ от сервера
    ///
    /// - Parameter response: Ответ от сервера в виде Data
    /// - Returns: Массив объектов Project
    public func parse(response: Data) throws -> [MyProject] {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try jsonDecoder.decode(APIResponse<ProjectsData>.self, from: response)
        return response.data.projects
    }
}
