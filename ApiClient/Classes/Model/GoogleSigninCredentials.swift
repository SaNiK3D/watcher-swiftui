//
//  GoogleSignInCredentials.swift
//  ApiClient
//
//  Created by Artem Garmash on 28/05/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Учетные данные Google
public struct GoogleSignInCredentials: Encodable {
    
    // Токен авторизации Google
    public let idToken: String
    
    public init(idToken: String) {
        self.idToken = idToken
    }
}
