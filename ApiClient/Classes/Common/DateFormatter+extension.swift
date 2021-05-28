//
//  DateFormatter+extension.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 20/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

public extension DateFormatter {

    /// DateFormatter для парсинга строки типа yyyy-MM-dd
    static var watcherDefault: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
    
    /// DateFormatter для парсинга строки типа dd.MM
    static var dayDotMonth: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        return dateFormatter
    }
    
    /// DateFormatter для парсинга строки типа dd.MM EEE
    static var dayDotMonthSpaceDay: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM, EEE"
        return dateFormatter
    }

    /// DateFormatter формата ISO8601 с указанием времени включая микросекунды и часового пояса
    static var watcherMicroseconds: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZZZZZ"
        return dateFormatter
    }

    /// DateFormatter формата ISO8601 с указанием времени
    static var watcherISO8601: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }
}
