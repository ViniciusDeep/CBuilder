//
//  LayoutProperty.swift
//  CBuilder
//
//  Created by Elias Paulino on 07/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation
import CoreGraphics

/// Represents a property assigned to a Anchor
protocol LayoutPropertyProtocol {
    associatedtype Anchor: LayoutAnchor
    
    var anchor: Anchor { get set }
    init(anchor: Anchor)
}

extension LayoutPropertyProtocol where Anchor: LayoutAnchor {
    func equal(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(equalTo: otherAnchor,
                          constant: constant).isActive = true
    }
    
    func greaterThanOrEqual(to otherAnchor: Anchor,
                            offsetBy constant: CGFloat = 0) {
        anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                          constant: constant).isActive = true
    }
    
    func lessThanOrEqual(to otherAnchor: Anchor,
                         offsetBy constant: CGFloat = 0) {
        anchor.constraint(lessThanOrEqualTo: otherAnchor,
                          constant: constant).isActive = true
    }
}

extension LayoutPropertyProtocol where Anchor: DimensionAnchor {
    func equal(to otherAnchor: Anchor, multiplier: CGFloat) {
        anchor.constraint(equalTo: otherAnchor, multiplier: multiplier).isActive = true
    }
    
    func equal(to constant: CGFloat) {
        anchor.constraint(equalToConstant: constant).isActive = true
    }
}

struct LayoutProperty<Anchor: LayoutAnchor>: LayoutPropertyProtocol {
    var anchor: Anchor
}

struct LayoutDimensionProperty<Anchor: DimensionAnchor>: LayoutPropertyProtocol {
    var anchor: Anchor
}
