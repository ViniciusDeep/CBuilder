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
        translatesAutoresizingMaskIntoConstraints = false
        
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
        translatesAutoresizingMaskIntoConstraints = false
        
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
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    /// Define with from anchor with NSLayoutDimension
    func cBuild(width: NSLayoutDimension) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: width).isActive = true
    }
    
    /// Define height from anchor with constant
    func cBuild(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    /// Define height from anchor with NSLayoutDimension
    func cBuild(height: NSLayoutDimension) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: height).isActive = true
    }
    
    /// Provides access to simple view actions. See `ViewAction` for the list of constraint configurations.
    func cBuild(make: ViewAction) {
        translatesAutoresizingMaskIntoConstraints = false
        switch make {
        case .fillSuperview:
            equalToSuperView(top: 0, leading: 0, trailing: 0, bottom: 0)
        case let .fillSuperviewWithPaddings(top, leading, trailing, bottom):
            equalToSuperView(top: top, leading: leading, trailing: trailing, bottom: bottom)
        case .centerInSuperView:
            centerInSuperView()
        case .centerXInSuperView:
            centerXInSuperView()
        case .centerYInSuperView:
            centerYInSuperView()
        case let .fillSuperviewFromTop(height, leading, trailing, top):
            equalToSuperView(top: top, leading: leading, trailing: trailing)
            cBuild(height: height)
        case let .fillSuperviewFromBottom(height, leading, trailing, bottom):
            equalToSuperView(leading: leading, trailing: trailing, bottom: bottom)
            cBuild(height: height)
        case let .fillSuperviewFromRight(width, top, bottom, trailing):
            equalToSuperView(top: top, trailing: trailing, bottom: bottom)
            cBuild(width: width)
        case let .fillSuperviewFromLeft(width, top, bottom, leading):
            equalToSuperView(top: top, leading: leading, bottom: bottom)
            cBuild(width: width)
        }
    }
    
    
    func cBuild(make: ConstraintAction) {
        translatesAutoresizingMaskIntoConstraints = false
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
        
    fileprivate func equalToSuperView(top: CGFloat? = nil, leading: CGFloat? = nil, trailing: CGFloat? = nil, bottom: CGFloat? = nil) {
        guard let spView = superview else {return}
        
        if let top = top {
            topAnchor.constraint(equalTo: spView.topAnchor, constant: top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: spView.leadingAnchor, constant: leading).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: spView.trailingAnchor, constant: -trailing).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: spView.bottomAnchor, constant: -bottom).isActive = true
        }
    }
}

enum ViewAction {
    case fillSuperview
    case fillSuperviewWithPaddings(top: CGFloat, leading: CGFloat, trailing: CGFloat, bottom: CGFloat)
    case fillSuperviewFromTop(height: CGFloat, leading: CGFloat, trailing: CGFloat, top: CGFloat)
    case fillSuperviewFromBottom(height: CGFloat, leading: CGFloat, trailing: CGFloat, bottom: CGFloat)
    case fillSuperviewFromRight(width: CGFloat, top: CGFloat, bottom: CGFloat, trailing: CGFloat)
    case fillSuperviewFromLeft(width: CGFloat, top: CGFloat, bottom: CGFloat, leading: CGFloat)
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
