//
//  LoggedTime.swift
//  watcher
//
//  Created by Daniil Subbotin on 17/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Списанное время
public struct LoggedTime: Decodable, Hashable {
    
    /// Идентификатор списанного времени
    public let id: Int

    /// Идентификатор проекта
    public let projectId: Int

    /// Количество минут для списания
    public let minutesSpent: Int

    /// Проект
    public let project: Project?

    /// Дата совершения операции списывания времени
    public let date: Date

    /// Состояние списанного времени
    public let status: LoggedTimeStatus

    /// Описание
    public let description: String

    /// Дата создания записи
    public let createdAt: Date

    /// Дата обновления записи
    public let updatedAt: Date

    /// Комментарии к записи
    public let comments: [Comment]?
    
    /// Пользователь
    public let user: User?

    /// Внешние зависимости
    public let externalEvents: [ExternalEvent]?
}
