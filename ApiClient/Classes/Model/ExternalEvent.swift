//
//  ExternalEvent.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 25.06.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

public struct ExternalEvent: Codable, Hashable {

    /// Сервис
    public let service: ExternalService

    /// ID Внешней записи
    public let externalId: String

    public init(service: ExternalService, externalId: String) {
        self.service = service
        self.externalId = externalId
    }
}
