//
//  ApiClient.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 16/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

public protocol ApiClient {

    /// Устанавливает cookie для авторизации на сервере
    ///
    /// - Parameter accessToken: Токен авторизации на сервере
    func setAuth(with accessToken: String)
    
    /// Удаляет установленный cookie авторизации
    func removeAuth()

    /// Отправляет запрос на сервер
    ///
    /// - Parameters:
    ///   - request: Класс-запрос реализующий протокол Endpoint
    ///   - completion: Обработанный ответ от сервера и заголовки
    func request<Request>(
        with request: Request,
        completion: @escaping (Result<Request.Response, Error>, [AnyHashable: Any]?) -> Void
    ) where Request: Endpoint

}
