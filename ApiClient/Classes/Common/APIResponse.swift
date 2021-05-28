//
//  APIResponse.swift
//  ApiClient
//
//  Created by Daniil Subbotin on 16/02/2019.
//  Copyright © 2019 Daniil Subbotin. All rights reserved.
//

import Foundation

/// Описывает ответ от сервера
struct APIResponse<Content>: Decodable where Content: Decodable {
    let data: Content
}
