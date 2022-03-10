//
//  TrapeziumShape.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 20..
//

import SwiftUI

struct TrapeziumShape: Shape {
    var leadingHeight: CGFloat = 50
    var trailingHeight: CGFloat = 20
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 0, y: height))
            p.addLine(to: CGPoint(x: 0, y: height-leadingHeight))
            p.addLine(to: CGPoint(x: width, y: height-trailingHeight))
            p.addLine(to: CGPoint(x: width, y: height))
            p.closeSubpath()
        }
        
        return path
    }
}
