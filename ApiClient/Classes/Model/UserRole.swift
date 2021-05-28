//
//  UserRole.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 10.06.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Состояние списанного времени
public enum UserRole: String, Decodable {

    /// Администратор
    case admin

    /// Менеджер
    case manager

    /// Аутстафф
    case outstaff

    /// Сотрудник
    case employee

}
