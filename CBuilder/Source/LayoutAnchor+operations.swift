//
//  LayoutAnchor+operations.swift
//  CBuilder
//
//  Created by Elias Paulino on 07/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation
import CoreGraphics


// Operator overloading

// SUM
func +<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, sum: CGFloat) {
    return (lhs, rhs)
}

func -<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, sum: CGFloat) {
    return (lhs, -rhs)
}


//MULTIPLICATON
func *<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, mult: CGFloat) {
    return (lhs, rhs)
}

func /<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, mult: CGFloat) {
    return (lhs, 1/rhs)
}

//EQUALITY

func ==<A: DimensionAnchor>(lhs: LayoutDimensionProperty<A>, rhs: CGFloat) {
    lhs.equal(to: rhs)
}

func ==<A: DimensionAnchor>(lhs: LayoutDimensionProperty<A>, rhs: (A, mult: CGFloat)) {
    lhs.equal(to: rhs.0, multiplier: rhs.mult)
}

func ==<A: LayoutAnchor>(lhs: LayoutDimensionProperty<A>, rhs: (A, sum: CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.sum)
}

func ==<A: LayoutAnchor>(lhs: LayoutDimensionProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}

func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, sum: CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.sum)
}

func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}

//GREATHER THEN

func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                         rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}

//LESS THEN

func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                         rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.lessThanOrEqual(to: rhs)
}
