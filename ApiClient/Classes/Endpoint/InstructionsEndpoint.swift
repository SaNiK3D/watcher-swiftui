//
//  HelpEndpoint.swift
//  ApiClient
//
//  Created by Nikolay Zhukov on 6/8/20.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

private struct InstructionsResponse: Decodable {
    let instructions: [Instruction]
}

/// Получение набора инструкций
public final class InstructionsEndpoint: Endpoint {
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Types
    
    public typealias Response = [Instruction]

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let queryParams = [
            "type": "mobile"
        ]
        let urlRequest = try requestBuilder.buildGETRequest(
            endpoint: "instructions/",
            queryParams: queryParams
        )
        return urlRequest
    }

    /// Парсит успешный ответ от сервера
    ///
    /// - Parameter response: Ответ от сервера в виде Data
    /// - Returns: Массив объектов `Instruction`
    public func parse(response: Data) throws -> [Instruction] {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try jsonDecoder.decode(APIResponse<InstructionsResponse>.self, from: response)
        return response.data.instructions
    }
    
}
