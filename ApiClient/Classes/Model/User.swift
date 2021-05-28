//
//  User.swift
//  ApiClient
//
//  Created by Тимофей Забалуев on 23.04.2020.
//  Copyright © 2020 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Модель пользователя
public struct User: Decodable, Equatable, Hashable {

    /// Отображаемое имя
    public let displayName: String
    
    /// ID
    public let id: Int
    
    /// Email
    public let email: String
}
