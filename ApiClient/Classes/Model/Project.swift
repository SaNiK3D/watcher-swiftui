//
//  Project.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 09/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Проект, в котором участвует пользователь
public struct Project: Decodable, Equatable, Hashable {
    
    /// Идентификатор
    public let id: Int
    
    /// Дата начала
    public let startDate: String?

    /// Коммерческий
    public let isCommercial: Bool?

    /// Архивное
    public let isArchived: Bool

    /// В избранном
    public let isFavorite: Bool?

    /// Название
    public let name: String

    /// Подтип
    public let subtype: String?

    /// Тип
    public let type: ProjectType?

    /// Менеджеры
    public let managers: [Manager]?

    public init(
        id: Int,
        startDate: String? = nil,
        isCommercial: Bool? = nil,
        isArchived: Bool,
        isFavorite: Bool? = nil,
        name: String,
        subtype: String? = nil,
        managers: [Manager]? = nil,
        type: ProjectType? = nil) {
        self.id = id
        self.startDate = startDate
        self.isCommercial = isCommercial
        self.isArchived = isArchived
        self.isFavorite = isFavorite
        self.name = name
        self.subtype = subtype
        self.managers = managers
        self.type = type
    }

}
