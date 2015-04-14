//
//  CalculationUtilityTests.swift
//  CalculationUtilityTests
//
//  Created by Rahul Nadella on 4/14/15.
//  Copyright (c) 2015 Rahul Nadella. All rights reserved.
//

import UIKit
import XCTest

class CalculationUtilityTests: XCTestCase
{
    override func setUp()
    {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDoubleAddition()
    {
        var a = 3;
        var b = 2.0;
        var total = a + b
        XCTAssertEqual(5.0, total);
    }
    
    func testPerformanceExample()
    {
        // This is an example of a performance test case.
        self.measureBlock()
        {
            // Put the code you want to measure the time of here.
        }
    }
    
}
