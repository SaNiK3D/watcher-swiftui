//
//  Day.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 25/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// День недели
public struct Day: Decodable {
    
    /// Дата
    public let date: Date
    
    /// Рабочий ли день
    public let isWorking: Bool
}
