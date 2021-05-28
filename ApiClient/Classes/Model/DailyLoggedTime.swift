//
//  DailyLoggedTime.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 24/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Списанное время за определенный день
public struct DailyLoggedTime: Decodable {
    
    /// Дата
    public let date: Date
    
    /// Рабочий ли день
    public let isWorking: Bool
    
    /// Записи о списанном времени
    public var loggedTimeRecords: [LoggedTime]

    public init(date: Date, isWorking: Bool, loggedTimes: [LoggedTime]) {
        self.date = date
        self.isWorking = isWorking
        loggedTimeRecords = loggedTimes
    }
}
