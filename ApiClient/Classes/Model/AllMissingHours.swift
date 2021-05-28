//
//  AllMissingHours.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 22.06.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Общее количество несписанных часов по дням
public struct MissingHoursList: Decodable, Equatable {

    /// Массив дней с долгом по каждому дню
    public let days: [MissingHours]

    /// Общее количество несписанных часов
    public let allMissingHours: Double
}
