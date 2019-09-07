//
//  LayoutProxy.swift
//  CBuilder
//
//  Created by Elias Paulino on 07/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation
import UIKit

class LayoutProxy {
    lazy var leading = property(with: view.leadingAnchor)
    lazy var trailing = property(with: view.trailingAnchor)
    lazy var top = property(with: view.topAnchor)
    lazy var bottom = property(with: view.bottomAnchor)
    lazy var width = property(with: view.widthAnchor)
    lazy var height = property(with: view.heightAnchor)
    lazy var centerX = property(with: view.centerXAnchor)
    lazy var centerY = property(with: view.centerYAnchor)
    
    private let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    private func property<A: DimensionAnchor>(with anchor: A) -> LayoutDimensionProperty<A> {
        return LayoutDimensionProperty(anchor: anchor)
    }
    
    private func property<A: LayoutAnchor>(with anchor: A) -> LayoutProperty<A> {
        return LayoutProperty(anchor: anchor)
    }
}
