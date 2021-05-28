//
//  ExternalService.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 25.06.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Внешние сервисы
public enum ExternalService: String, Codable {

    /// Jira
    case jira

    /// Google-календарь
    case googleCalendar = "google_calendar"

}
