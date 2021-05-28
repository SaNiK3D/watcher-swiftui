//
//  ServiceLayer.swift
//  pager
//
//  Created by Aleksandr Sidorov on 27.05.2021.
//

final class ServiceLayer {
    private init() {}
    
    static let shared = ServiceLayer()
    
    private(set) lazy var client = ApiClientImpl(baseURL: Constants.baseURL)
    
    private(set) lazy var tokenStorage = AuthTokenStorage()
    private(set) lazy var signInService: SignInServiceProtocol = SignInService(client: client)
}
