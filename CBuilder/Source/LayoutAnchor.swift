//
//  LayoutAnchor.swift
//  CBuilder
//
//  Created by Vinicius Mangueira on 28/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol LayoutAnchor {
    func constraint(equalTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutAnchor: LayoutAnchor {}

protocol LayoutXAnchor {
    func constraint(equalToSystemSpacingAfter anchor: NSLayoutXAxisAnchor, multiplier: CGFloat) -> NSLayoutConstraint
    
    func constraint(greaterThanOrEqualToSystemSpacingAfter anchor: NSLayoutXAxisAnchor, multiplier: CGFloat) -> NSLayoutConstraint
    
    func constraint(lessThanOrEqualToSystemSpacingAfter anchor: NSLayoutXAxisAnchor, multiplier: CGFloat) -> NSLayoutConstraint
}


extension NSLayoutXAxisAnchor: LayoutXAnchor {}

struct LayoutProperty<Anchor: LayoutAnchor> {
    fileprivate let anchor: Anchor
}


struct LayoutPropertyX<Anchor: LayoutXAnchor> {
    fileprivate let anchor: Anchor
}

class LayoutProxy {
    lazy var leading = property(with: view.leadingAnchor)
    lazy var trailing = property(with: view.trailingAnchor)
    lazy var top = property(with: view.topAnchor)
    lazy var bottom = property(with: view.bottomAnchor)
    lazy var width = property(with: view.widthAnchor)
    lazy var height = property(with: view.heightAnchor)
    
    private let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    private func property<A: LayoutAnchor>(with anchor: A) -> LayoutProperty<A> {
        return LayoutProperty(anchor: anchor)
    }
}

extension LayoutPropertyX {
    func equal(to otherAnchor: Anchor, multiplier: CGFloat = 0) {
        anchor.constraint(equalToSystemSpacingAfter: otherAnchor as! NSLayoutXAxisAnchor, multiplier: multiplier).isActive = true
    }
    
}

extension LayoutProperty {
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


// Operator overloading


func +<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}


func -<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, -rhs)
}

func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.1)
}

func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}

func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                         rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}

func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                         rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.lessThanOrEqual(to: rhs)
}


