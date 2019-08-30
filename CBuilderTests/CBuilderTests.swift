//
//  CBuilderTests.swift
//  CBuilderTests
//
//  Created by Vinicius Mangueira on 28/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import XCTest
@testable import CBuilder

class CBuilderTests: XCTestCase {

    let mainView = UIView(frame: UIScreen.main.bounds)
    
    /// Test at subviews
    func testAddSubViews() {
        let stubView = UIView(frame: .zero)
        let scrubView = UIView(frame: .zero)
        
        
        mainView.addSubviews([stubView, scrubView])
        
        let subViews = [stubView, scrubView]
        
        
        let subviews = mainView.subviews.map({$0})
        
        XCTAssertEqual(subViews, subviews)
    }
    
    func testStaticMethodsConstraintsAtView() {
        let scrub = UIView()
        mainView.addSubviews([scrub])
        scrub.cBuild(make: .fillSuperview)
        XCTAssertNotNil(scrub.constraints)
    }
    
    func testDSLClosureConstructor() {
        
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
