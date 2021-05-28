//
//  Comment.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 22.05.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Модель комментария
public struct Comment: Codable, Hashable {

    /// Текст комментария
    public let text: String

    /// Дата создания комментария
    public let createdAt: Date

}
