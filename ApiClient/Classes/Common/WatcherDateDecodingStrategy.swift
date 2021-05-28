//
//  JSONDecoder.DateDecodingStrategy+extension.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 24/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

enum WatcherDateDecodingStrategy {

    static func decode(_ decoder: Decoder) throws -> Date {
        let container = try decoder.singleValueContainer()
        let dateStr = try container.decode(String.self)
        var optionalDates: [Date?] = []
        optionalDates.append(DateFormatter.watcherDefault.date(from: dateStr))
        optionalDates.append(DateFormatter.watcherMicroseconds.date(from: dateStr))
        // От google API прилетают разные форматы дат "2020-06-22T00:00:00" и "2020-06-22T12:00:00+04:00"
        optionalDates.append(ISO8601DateFormatter().date(from: dateStr))
        optionalDates.append(DateFormatter.watcherISO8601.date(from: dateStr))
        let unwrappedDates = optionalDates.compactMap { $0 }
        guard let unwrappedDate = unwrappedDates.first else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Не удается декодировать дату")
        }
        return unwrappedDate
    }

}
