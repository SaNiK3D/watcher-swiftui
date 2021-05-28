//
//  SignInCredentials.swift
//  watcher
//
//  Created by Daniil Subbotin on 17/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Данные для входа
public struct SignInCredentials: Encodable {
    
    /// Email
    public let email: String

    /// Пароль
    public let password: String

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
