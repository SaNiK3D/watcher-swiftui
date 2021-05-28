//
//  ProjectReport.swift
//  ApiClient
//
//  Created by z.samarskaya on 18.08.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Затраченные часы по пользователям
public struct ProjectReport: Decodable {
    
    /// Название проекта
    public let name: String
    
    /// Затраченные часы по пользователям
    public let employees: [EmployeeReport]
    
}
