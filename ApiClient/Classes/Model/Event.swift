//
//  Event.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 24.06.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Событие гугл-календаря
public struct Event: Decodable {

    /// Описание
    public let description: String

    /// Заголовок события в календаре
    public let summary: String

    /// Длительность в минутах
    public let duration: Int

    /// Дата и время начала события
    public let start: Date

    /// ID проекта
    public let projectId: Int?

    /// Внутренняя ID записи
    public let id: String
}
