//
//  UtilizationProject.swift
//  ApiClient
//
//  Created by Nikolay Zhukov on 6/8/20.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Проект для заполнения времени.
public struct UtilizationProject: Decodable {
    
    /// Идентификатор
    public let id: Int
    
    /// Название
    public let name: String
    
    public init(
        id: Int,
        name: String) {
        self.id = id
        self.name = name
    }
}
