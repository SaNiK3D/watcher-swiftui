//
//  MissingHours.swift
//  ApiClient
//
//  Created by Тимофей Забалуев on 21.04.2020.
//  Copyright © 2020 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Количество несписанных часов по дням
public struct MissingHours: Decodable, Equatable {

    /// Дата
    public let date: Date
    
    /// Количество несписанных часов
    public let missingHours: Double
}
