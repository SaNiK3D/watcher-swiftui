//
//  ProjectType.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 19.06.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Тип проекта
public enum ProjectType: String, Decodable {
    /// Болезнь
    case illness

    /// Выходной
    case vacation

    /// Некоммерческий
    case noncommercial

    /// Коммерческий
    case commercial

    /// Инвестиционный
    case investment
}
