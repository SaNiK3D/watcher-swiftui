//
//  GetLoggedTimesEndpoint.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 20/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

private struct DaysLoggedTime: Decodable {
    let days: [DailyLoggedTime]
}

/// Конечная точка API для списания времени
public final class GetLoggedTimesEndpoint: Endpoint {

    // MARK: - Types

    public typealias Response = [DailyLoggedTime]

    // MARK: - Private Properties

    private let from: String
    private let to: String

    // MARK: - Initializers

    public init(from: String, to: String) {
        self.from = from
        self.to = to
    }

    // MARK: - Public methods

    public func makeRequest(with requestBuilder: URLRequestBuilder) throws -> URLRequest {
        let urlRequest = try requestBuilder.buildGETRequest(
            endpoint: "days",
            queryParams: ["from": from, "to": to]
        )
        return urlRequest
    }

    /// Парсит ответ от сервера
    ///
    /// - Parameter response: Ответ от сервера в виде Data
    /// - Returns: Массив списанного времени за каждый день
    public func parse(response: Data) throws -> [DailyLoggedTime] {
        var dailyLoggedTimeArray = [DailyLoggedTime]()
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .custom(WatcherDateDecodingStrategy.decode)
        let response = try jsonDecoder.decode(APIResponse<DaysLoggedTime>.self, from: response)
        for day in response.data.days {
            dailyLoggedTimeArray.append(
                DailyLoggedTime(
                    date: day.date,
                    isWorking: day.isWorking,
                    loggedTimes: day.loggedTimeRecords
                )
            )
        }
        return dailyLoggedTimeArray
    }
}
