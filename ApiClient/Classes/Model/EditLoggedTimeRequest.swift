//
//  EditLoggedTimeRequest.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 05/04/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Запрос на редактирование списанного времени
public struct EditLoggedTimeRequest: Encodable {

    private enum CodingKeys: String, CodingKey {
        case minutesSpent
        case description
    }

    /// Идентификатор списанного времени
    public let loggedTimeId: Int

    /// Количество минут для списания
    public let minutesSpent: Int

    /// Описание
    public let description: String

    public init(
        loggedTimeId: Int,
        minutesSpent: Int,
        description: String) {
        self.loggedTimeId = loggedTimeId
        self.minutesSpent = minutesSpent
        self.description = description
    }
}
