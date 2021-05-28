//
//  ProjectsEndpoint.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 16/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

private struct ProjectsData: Decodable {
    let projects: [Project]
}

/// Конечная точка API для работы с проектами
public final class ProjectsEndpoint: Endpoint {
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Types
    
    public typealias Response = [Project]

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let urlRequest = try requestBuilder.buildGETRequest(
            endpoint: "projects/"
        )
        return urlRequest
    }

    /// Парсит успешный ответ от сервера
    ///
    /// - Parameter response: Ответ от сервера в виде Data
    /// - Returns: Массив объектов Project
    public func parse(response: Data) throws -> [Project] {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try jsonDecoder.decode(APIResponse<ProjectsData>.self, from: response)
        return response.data.projects
    }
}
