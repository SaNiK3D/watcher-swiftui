//
//  LoggedTimeStatus.swift
//  watcher
//
//  Created by Daniil Subbotin on 17/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Состояние списанного времени
public enum LoggedTimeStatus: String, Decodable {
    /// В ожидании
    case pending

    /// Утверждено
    case approved

    /// Отклонено
    case rejected
}
