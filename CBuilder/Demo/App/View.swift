//
//  View.swift
//  CBuilder
//
//  Created by Vinicius Mangueira on 28/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class View: UIView {
    
    let label: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "CBuilder is good"
        lb.backgroundColor = .red
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.cBuild { (layout) in
            layout.centerX == self.centerXAnchor
            layout.centerY == self.centerYAnchor
            layout.height == 200
            layout.width == self.widthAnchor / 2
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
