//
//  Pie.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/26.
//

import SwiftUI

struct Pie: Shape {
    // why not let?
    // startAngle과 endAngle은 animate할 때 사용될 변수들이기 때문
    var startAngle: Angle
    var endAngle: Angle
    // let으로 선언하면 init할 때 false로 선언이 되어버림.
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !clockwise
        )
        p.addLine(to: center)
        return p
    }
}
