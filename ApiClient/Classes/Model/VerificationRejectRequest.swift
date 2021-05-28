//
//  VerificationRejectRequest.swift
//  ApiClient
//
//  Created by Sergei Popyvanov on 22.05.2020.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

// Запрос на отклонение списанного времени
public struct VerificationRejectRequest: Encodable {

    /// Идентификатор списанного времени для отклонения
    public let loggedTimeId: Int

    /// Комментарий к отклонению записи
    public let comment: Comment

    public init(loggedTimeId: Int, comment: Comment) {
        self.loggedTimeId = loggedTimeId
        self.comment = comment
    }

}
