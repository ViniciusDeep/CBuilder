//
//  CBuilder.swift
//  CBuilder
//
//  Created by Vinicius Mangueira on 28/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension UIView {
    //This method add arrange of view in view
    func addSubviews(_ views: [UIView]) {
        views.forEach { (view) in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
    
    /// This method is calling to set all constraints in to respective anchors
    func cBuild(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let tope = top {
            topAnchor.constraint(equalTo: tope).isActive = true
        }
        
        if let bott = bottom {
            bottomAnchor.constraint(equalTo: bott).isActive = true
        }
        
        if let leading = left {
            leadingAnchor.constraint(equalTo: leading).isActive = true
        }
        
        if let trailing = right {
            trailing.constraint(equalTo: trailing).isActive = true
        }
    }
    
    /// Method calling when you to consider your view equal to
    func cBuild(equalTo: ViewType) {
        self.translatesAutoresizingMaskIntoConstraints = false
        switch equalTo {
        case .superview:
            equalToSuperView()
        }
    }
    
    fileprivate func equalToSuperView() {
        guard let spView = superview else {return}
        NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: spView.topAnchor),
                leadingAnchor.constraint(equalTo: spView.leadingAnchor),
                trailingAnchor.constraint(equalTo: spView.trailingAnchor),
                bottomAnchor.constraint(equalTo: spView.bottomAnchor)
            ])
    }
    
    
}

enum ViewType {
    case superview
}
