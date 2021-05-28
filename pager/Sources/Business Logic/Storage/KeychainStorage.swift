//
//  TokenStorage.swift
//  watcher
//
//  Created by Artem Garmash on 05/06/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation
import KeychainAccess

/// Класс для работы с токеном авторизации, хранимом в Keychain
final class AuthTokenStorage {
    
    // MARK: - Private Properties
    
    private let accessTokenKey = "accessToken"
    private static let defaultServiceName = "com.redmadrobot.Watcher-App"

    private let keychain: Keychain
    
    // MARK: - Initializers
    
    init(withServiceName serviceName: String = defaultServiceName) {
        keychain = Keychain(service: serviceName)
    }
    
    // MARK: - Public methods
    
    /// Сохраняет токен
    ///
    /// - Parameter token: Токен, который требуется сохранить
    public func saveToken(_ token: String) throws {
        try keychain.set(token, key: accessTokenKey)
    }
    
    /// Возвращает токен
    ///
    /// - Returns: Значение токена при его наличии, либо nil при его отсутствии
    public func getToken() -> String? {
        try? keychain.get(accessTokenKey)
    }
    
    /// Удаляет токен из хранилища
    public func removeToken() throws {
        try keychain.remove(accessTokenKey)
    }
    
    /// Проверяет наличие токена в хранилище
    ///
    /// - Returns: Факт наличия токена
    public func isTokenExists() -> Bool {
        getToken() != nil
    }
}
