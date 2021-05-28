//
//  MyProject.swift
//  ApiClient
//
//  Created by Тимофей Забалуев on 29.04.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Проект, в котором пользователь менеджер
public struct MyProject: Decodable, Equatable {
    
    /// Тип
    public let type: String?

    /// Менеджеры
    public let managers: [MyManager]?
    
    /// ID
    public let id: Int
    
    /// Название
    public let name: String
}
