//
//  LogTimeRequest.swift
//  watcher
//
//  Created by Daniil Subbotin on 17/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Запрос на списание времени
public struct LogTimeRequest: Encodable {
    
    /// Идентификатор проекта
    public let projectId: Int

    /// Количество минут для списания
    public let minutesSpent: Int

    /// Дата совершения операции списывания времени
    public let date: Date

    /// Описание
    public let description: String

    /// Внешние зависимости
    public let externalEvents: [ExternalEvent]?

    public init(
        projectId: Int,
        minutesSpent: Int,
        date: Date,
        description: String,
        externalEvents: [ExternalEvent]? = nil) {
        self.projectId = projectId
        self.minutesSpent = minutesSpent
        self.date = date
        self.description = description
        self.externalEvents = externalEvents
    }
}
