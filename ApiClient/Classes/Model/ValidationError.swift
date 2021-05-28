//
//  ValidationError.swift
//  ApiClient
//
//  Created by Nikolay Zhukov on 7/20/20.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

public struct ValidationError: Decodable, Error {
    
    /// Код ошибки.
    public struct Code: RawRepresentable, Decodable, Equatable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }

        public init(_ rawValue: String) {
            self.rawValue = rawValue
        }
    }
    
    public struct ValidationDescription: Decodable {
        public var newPassword: [String]
    }
    
    /// Код ошибки.
    public let code: Code
    
    public let description: ValidationDescription
}
