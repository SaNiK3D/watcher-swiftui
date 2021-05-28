//
//  CommercialUtilization.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 22.06.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Коммерческая утилизация пользователя
public struct CommercialUtilization: Decodable {

    /// Процент коммерческой утилизации
    public let percents: Int

    /// Дата начала периода
    public let from: Date

    /// Дата конца периода, и nil если период еще не закончился
    public let to: Date?

    public init(
        percents: Int,
        from: Date,
        to: Date?) {
        self.percents = percents
        self.from = from
        self.to = to
    }

}
