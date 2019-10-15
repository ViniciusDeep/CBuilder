//
//  CBuilder.swift
//  CBuilder
//
//  Created by Vinicius Mangueira on 28/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension UIView {
    /// This method add arrange of view in view
    func addSubviews(_ views: [UIView]) {
        views.forEach { (view) in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
    
    func cBuild(_ make : (LayoutProxy) -> ()) {
        translatesAutoresizingMaskIntoConstraints = false
        make(LayoutProxy(view: self))
    }
    
    /// This constraints with you respective constant, always anchor following with you constant
    func cBuild(top: NSLayoutYAxisAnchor?, costantTop: CGFloat = 0, bottom: NSLayoutYAxisAnchor?, constantBottom: CGFloat = 0, left: NSLayoutXAxisAnchor?, constantLeft: CGFloat = 0,  right: NSLayoutXAxisAnchor?, constantRight: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let tope = top {
            topAnchor.constraint(equalTo: tope, constant: costantTop).isActive = true
        }
        
        if let bott = bottom {
             bottomAnchor.constraint(equalTo: bott, constant: constantBottom).isActive = true
        }
        
        if let leading = left {
            leadingAnchor.constraint(equalTo: leading, constant: constantLeft).isActive = true
        }
        
        if let trailing = right {
            trailing.constraint(equalTo: trailing, constant: constantRight).isActive = true
        }
    }
    
    
    func cBuild(to anchor: TypeAnchor, with priotity: CGFloat) {
        switch anchor {
        case .top:
            break
        default:
            break
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
    
    /// Define width from anchor with constant
    func cBuild(width: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    /// Define with from anchor with NSLayoutDimension
    func cBuild(width: NSLayoutDimension) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: width).isActive = true
    }
    
    /// Define height from anchor with constant
    func cBuild(height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    /// Define height from anchor with NSLayoutDimension
    func cBuild(height: NSLayoutDimension) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: height).isActive = true
    }
    
    /// Method calling when you to consider your view equal to
    func cBuild(make: ViewAction) {
        self.translatesAutoresizingMaskIntoConstraints = false
        switch make {
        case .fillSuperview:
            equalToSuperView()
        case .centerInSuperView:
            equalToSuperView()
        case .centerXInSuperView:
            centerXInSuperView()
        case .centerYInSuperView:
            centerYInSuperView()
        }
    }
    
    
    func cBuild(make: ConstraintAction) {
        self.translatesAutoresizingMaskIntoConstraints = false
        switch make {
        case .deactivateAllConstraints:
            constraints.forEach { (constraint) in
                constraint.isActive = false
            }
        }
    }
    
    fileprivate func centerInSuperView() {
        centerXInSuperView()
        centerYInSuperView()
    }
    
    fileprivate func centerXInSuperView() {
        guard let spView = superview else {return}
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: spView.centerXAnchor),
            ])
    }
    
    fileprivate func centerYInSuperView() {
        guard let spView = superview else {return}
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: spView.centerYAnchor),
            ])
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

enum ViewAction {
    case fillSuperview
    case centerInSuperView
    case centerXInSuperView
    case centerYInSuperView
}


enum ConstraintAction {
    case deactivateAllConstraints
}

enum TypeAnchor {
    case top
    case leading
    case trailing
    case bottom
}
