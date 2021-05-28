//
//  MyManager.swift
//  ApiClient
//
//  Created by Тимофей Забалуев on 29.04.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Модель менаджера
public struct MyManager: Decodable, Equatable {
    
    /// ID
    public let id: Int
    
    /// Отображаемое имя
    public let displayName: String
    
    /// Email
    public let email: String
}
