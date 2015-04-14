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
    
    func testSumOfInt() {
        let sum1 = ∑([1, 2, 3])
        let sum2 = sumOf(1, 2, 3)
        
        let arr = [1, 2, 3]
        let sum3 = ∑(arr)
        
        let sum4 = sumOf(arr)
        let sum5 = sumOf(arr[0...1])
        
        XCTAssertEqual(6, sum1, "Int should be sumable")
        XCTAssertEqual(6, sum2, "Int should be sumable")
        XCTAssertEqual(6, sum3, "Int should be sumable")
        XCTAssertEqual(6, sum4, "Int should be sumable")
        XCTAssertEqual(3, sum5, "Int should be sumable")
    }
    
    func testSumOfDouble() {
        let sum1 = ∑([1.1, 2.2, 3.3])
        let sum2 = sumOf(1.1, 2.2, 3.3)
        
        let arr = [1.1, 2.2, 3.3]
        let sum3 = ∑(arr)
        let sum4 = sumOf(arr)
        let sum5 = sumOf(arr[0...1])
        
        let accuracy = 1E-10
        XCTAssertEqualWithAccuracy(6.6, sum1, accuracy, "Double should be sumable")
        XCTAssertEqualWithAccuracy(6.6, sum2, accuracy, "Double should be sumable")
        XCTAssertEqualWithAccuracy(6.6, sum3, accuracy, "Double should be sumable")
        XCTAssertEqualWithAccuracy(6.6, sum4, accuracy, "Double should be sumable")
        XCTAssertEqualWithAccuracy(3.3, sum5, accuracy, "Double should be sumable")
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
