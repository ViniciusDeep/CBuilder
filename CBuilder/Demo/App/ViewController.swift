//
//  ViewController.swift
//  CBuilder
//
//  Created by Vinicius Mangueira on 28/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myView = View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        view.backgroundColor = .white
        //myView.cBuild(equalTo: .superview)
        myView.cBuild(make: .fillSuperview)
        
        
    }
}

