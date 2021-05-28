//
//  NewPassword.swift
//  ApiClient
//
//  Created by Nikolay Zhukov on 6/9/20.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

public struct NewPassword: Encodable {
    public let newPassword: String
    public let token: String
    
    public init(newPassword: String, token: String) {
        self.newPassword = newPassword
        self.token = token
    }
}
