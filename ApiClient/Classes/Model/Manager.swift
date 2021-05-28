//
//  Manager.swift
//  ApiClient
//
//  Created by Тимофей Забалуев on 29.04.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Модель менаджера
public struct Manager: Decodable, Equatable, Hashable {
    
    /// ID
    public let id: Int
    
    /// Имя
    public let firstName: String?
    
    /// Фамилия
    public let lastName: String?
    
    /// Роль
    public let role: String?
    
    /// Email
    public let email: String?
}
