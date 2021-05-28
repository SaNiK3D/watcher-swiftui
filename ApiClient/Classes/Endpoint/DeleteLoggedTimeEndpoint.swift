//
//  DeleteLoggedTimeEndpoint.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 17/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Конечная точка API для удаления списанного времени
public final class DeleteLoggedTimeEndpoint: Endpoint {

    // MARK: - Types
    
    public typealias Response = Void

    // MARK: - Private Properties
    
    private let loggedTimeId: Int
    
    // MARK: - Initializers

    public init(loggedTimeId: Int) {
        self.loggedTimeId = loggedTimeId
    }

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let urlRequest = requestBuilder.buildDELETERequest(
            endpoint: "logged-time/",
            id: "\(loggedTimeId)"
        )
        return urlRequest
    }

    public func parse(response: Data) throws {}

}
