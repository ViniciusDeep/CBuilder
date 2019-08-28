//
//  CBuilder.swift
//  CBuilder
//
//  Created by Vinicius Mangueira on 28/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension UIView {
    
    
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { (view) in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
    
    func cBuild() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
