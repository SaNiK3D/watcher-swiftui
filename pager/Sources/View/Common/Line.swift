//
//  Line.swift
//  pager
//
//  Created by Aleksandr Sidorov on 26.05.2021.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        return path
    }
}
