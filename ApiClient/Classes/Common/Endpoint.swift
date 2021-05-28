//
//  Endpoint.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 16/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

private struct ResponseError: Decodable {
    let error: APIError
}

private struct ValidationResponseError: Decodable {
    let error: ValidationError
}

/// Конечная точка API
public protocol Endpoint {
    associatedtype Response

    /// Возвращает экземпляр URLRequest 
    func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest

    /// Парсит ответ от сервера
    func parse(response: Data) throws -> Response
}

extension Endpoint {

    /// Парсит ошибку от сервера
    func parseError(response: Data) throws -> APIError {
        let jsonDecoder = JSONDecoder()
        let response = try jsonDecoder.decode(ResponseError.self, from: response)
        return response.error
    }
    
    /// Парсим ошибку валидации
    func parseValidationError(response: Data) throws -> ValidationError {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try jsonDecoder.decode(ValidationResponseError.self, from: response)
        return response.error
    }
}
