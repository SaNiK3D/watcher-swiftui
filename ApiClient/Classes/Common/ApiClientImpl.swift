//
//  ApiClientImpl.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 18/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation
import SystemConfiguration

/// Клиент для работы с API
public final class ApiClientImpl: ApiClient {
    
    // MARK: - Constants
    
    private enum AuthCookieConstants {
        static let name = "access_token"
        static let path = "/"
        static let maxAge: TimeInterval = 1209600 //константное значение, установленное на сервере
    }

    // MARK: - Private Properties

    private let urlSession: URLSession
    
    private var cookieStorage: HTTPCookieStorage? {
        urlSession.configuration.httpCookieStorage
    }
    
    private let baseURL: URL
    private let requestBuilder: URLRequestBuilder
    
    // MARK: - Initializers

    public init(baseURL: URL) {
        self.baseURL = baseURL
        self.requestBuilder = URLRequestBuilder(baseURL: baseURL)
        
        let config = URLSessionConfiguration.ephemeral
        config.requestCachePolicy = .reloadIgnoringCacheData
        config.urlCache = nil
        let delegate = SessionDelegate()
        let delegateQueue = OperationQueue.main
        self.urlSession = URLSession(configuration: config, delegate: delegate, delegateQueue: delegateQueue)
    }

    public init(urlSession: URLSession, baseURL: URL) {
        self.urlSession = urlSession
        self.requestBuilder = URLRequestBuilder(baseURL: baseURL)
        self.baseURL = baseURL
    }

    // MARK: - Public methods
    
    public func setAuth(with accessToken: String) {
        removeAuth()
        
        guard let urlHost = baseURL.host else {
            fatalError("Невозможно получить host из baseURL")
        }
        
        let cookie = HTTPCookie(properties: [
            .domain: urlHost,
            .name: AuthCookieConstants.name,
            .path: AuthCookieConstants.path,
            .value: accessToken,
            .expires: Date(timeIntervalSinceNow: AuthCookieConstants.maxAge),
            .secure: false
        ])!
        
        cookieStorage?.setCookie(cookie)
    }
    
    public func removeAuth() {
        cookieStorage?.cookies?
            .filter { $0.name == AuthCookieConstants.name }
            .forEach { cookieStorage?.deleteCookie($0) }
    }

    public func request<Request>(
        with request: Request,
        completion: @escaping (Result<Request.Response, Error>, [AnyHashable: Any]?) -> Void
        ) where Request: Endpoint {
        
        let urlRequest: URLRequest
        do {
            try urlRequest = request.makeRequest(with: requestBuilder)
        } catch {
            completion(.failure(error), nil)
            return
        }
        
        let dataTask = urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
            if let error = error {
                completion(.failure(error), nil)
                return
            }
            
            guard let response = urlResponse as? HTTPURLResponse else {
                completion(.failure(APIError(code: .serverError)), nil)
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError(code: .serverError)), nil)
                return
            }
            switch response.statusCode {
            case 200...399:
                do {
                    let data = try request.parse(response: data)
                    completion(.success(data), response.allHeaderFields)
                } catch {
                    completion(.failure(error), response.allHeaderFields)
                }
            case 400...:
                do {
                    let apiError = try request.parseError(response: data)
                    if apiError.code == .validationError {
                        let validationError = try request.parseValidationError(response: data)
                        completion(.failure(validationError), nil)
                    } else {
                        completion(.failure(apiError), nil)
                    }
                } catch {
                    completion(.failure(APIError(code: .serverError)), nil)
                }
            default:
                completion(.failure(APIError(code: .serverError)), nil)
            }
        }
        dataTask.resume()
    }
    
}
