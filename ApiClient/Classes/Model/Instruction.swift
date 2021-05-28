//
//  Instruction.swift
//  ApiClient
//
//  Created by Nikolay Zhukov on 6/8/20.
//  Copyright © 2020 RedMadRobot. All rights reserved.
//

import Foundation

/// Инструкция
public struct Instruction: Decodable {
    
    /// Тег
    public let tag: String
    
    /// Имя
    public let name: String

    /// Текст в формате Markdown
    public let text: String
}
