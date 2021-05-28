//
//  SessionDelegate.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 17/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation
import os

final class SessionDelegate: NSObject, URLSessionTaskDelegate {

    private let enabledLogging = false

    func urlSession(
        _ session: URLSession,
        task: URLSessionTask,
        didFinishCollecting metrics: URLSessionTaskMetrics) {

        guard enabledLogging == true else {
            return
        }
        
        print("Metrics:")
        let duration = String(format: "%.4f", metrics.taskInterval.duration)
        print("Task duration = \(duration) s, redirect count = \(metrics.redirectCount)")

        var id = 1
        for metric in metrics.transactionMetrics {
            print("Metric #\(id)")
            print("Request = " + String(describing: metric.request))
            print("Response = " + String(describing: metric.response))

            print("fetchStartDate = " + String(describing: metric.fetchStartDate))
            print("domainLookupStartDate = " + String(describing: metric.domainLookupStartDate))
            print("domainLookupEndDate = " + String(describing: metric.domainLookupEndDate))
            print("connectStartDate = " + String(describing: metric.connectStartDate))
            print("secureConnectionStartDate = " + String(describing: metric.secureConnectionStartDate))
            print("secureConnectionEndDate = " + String(describing: metric.secureConnectionEndDate))
            print("connectEndDate = " + String(describing: metric.connectEndDate))
            print("requestStartDate = " + String(describing: metric.requestStartDate))
            print("requestEndDate = " + String(describing: metric.requestEndDate))
            print("responseStartDate = " + String(describing: metric.responseStartDate))
            print("responseEndDate = " + String(describing: metric.responseEndDate))

            id += 1
        }
    }
}
