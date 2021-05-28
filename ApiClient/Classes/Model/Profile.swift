//
//  Profile.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 10.06.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Профиль пользователя
public struct Profile: Decodable {

    /// Отображаемое имя с фамилией
    public let displayName: String

    /// Проекты, которые может верифицировать пользователь
    public let managesProjects: [MyProject]

    /// Данные о коммерческой утилизации пользователя, расположены в порядке возрастания начала периода
    public let commercialUtilization: [CommercialUtilization]

    /// Email
    public let email: String

    /// Отображаемая роль
    public let displayRole: String

    /// Компания
    public let company: Company
    
}
