//
//  LoggedTimeListRequest.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 22.05.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Запрос на верификацию списка активностей
public struct LoggedTimeListRequest: Encodable {

    /// Идентификаторы списанного времени через запятую
    public let loggedTimeIds: String

    public init(loggedTimeIds: [Int]) {
        let stringLoggedTimeIds = loggedTimeIds.map { String($0) }
        self.loggedTimeIds = stringLoggedTimeIds.joined(separator: ",")
    }

}
