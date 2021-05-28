//
//  URLRequestBuilder.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 08/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case error
}

/// Создает экземпляры URLRequest на основе переданных параметров
public final class URLRequestBuilder {

    private let baseURL: URL

    init(baseURL: URL) {
        self.baseURL = baseURL
    }

    /**
     Создает URLRequest для отправки запроса на основе объекта Data с JSON данными
     - Parameter endpoint: API метод
     - Parameter jsonData: JSON данные в виде Data
     - Returns: Возвращает экземпляр URLRequest
     */
    func buildRequest(endpoint: String, httpMethod: HTTPMethod, jsonData: Data? = nil) -> URLRequest {
        let url = baseURL.appendingPathComponent(endpoint)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.timeoutInterval = 10.0
        if let jsonData = jsonData {
            urlRequest.httpBody = jsonData
            urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
        return urlRequest
    }

    /**
     Создает экземпляр URLRequest для отправки GET запроса на основе Query параметров
     - Parameter endpoint: API метод
     - Parameter payload: Query параметры
     - Returns: Возвращает экземпляр URLRequest
     */
    func buildGETRequest(endpoint: String, queryParams: [String: String?]? = nil) throws -> URLRequest {
        let urlString = baseURL.appendingPathComponent(endpoint).absoluteString
        guard var components = URLComponents(string: urlString) else {
            throw RequestError.error
        }
        
        components.queryItems = queryParams?
            .compactMapValues { $0 }
            .map { URLQueryItem(name: $0, value: $1) }
        
        guard let url = components.url else {
            throw RequestError.error
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.timeoutInterval = 10.0
        return urlRequest
    }

    /**
     Создает экземпляр URLRequest для отправки DELETE запроса
     - Parameter endpoint: API метод
     - Parameter id: Идентификатор объекта для удаления
     - Returns: Возвращает экземпляр URLRequest
     */
    func buildDELETERequest(endpoint: String, id: String) -> URLRequest {
        let url = baseURL.appendingPathComponent(endpoint).appendingPathComponent(id)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        urlRequest.timeoutInterval = 10.0
        return urlRequest
    }
}
