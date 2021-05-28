//
//  UserReport.swift
//  ApiClient
//
//  Created by z.samarskaya on 18.08.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Затраченные часы по пользователям
public struct EmployeeReport: Decodable {
        
    /// Имя сотрудника
    public let displayName: String
    
    /// Количество списанных часов на проекте
    public let realHours: Double
    
    /// Количество недосписанных часов
    public let missingHours: Double

}
