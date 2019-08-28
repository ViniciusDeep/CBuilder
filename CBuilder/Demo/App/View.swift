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
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.cBuild(make: .fillSuperview)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
