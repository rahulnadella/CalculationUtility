/*
The MIT License (MIT)

Copyright (c) <year> <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

import UIKit
import XCTest
/*
The CalculationUtilityTests class provides the specific test cases for the 
implemenation of the CalculationUtility.

:version 1.0
*/
class CalculationUtilityTests: XCTestCase
{
    private var integerValue:Int = 10
    private var floatValue:Float = 1.0
    private var doubleValue:Double = 1.34567890123456
    private var uIntValue = 1234;
    
    let accuracy = 0.00000001
    /*
    Setup method for CalculationUtilityTests
    */
    override func setUp()
    {
        super.setUp()
        
        /* Put setup code here. This method is called before the invocation of each test method in the class. */
    }
    
    /*
    TearDown method for the CalculationUtilityTests
    */
    override func tearDown()
    {
        /* Put teardown code here. This method is called after the invocation of each test method in the class. */
        super.tearDown()
    }
    
    func testSumOfInt()
    {
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
    
    func testSumOfDouble()
    {
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
    
    /*
    Function tests CalculationUtility.+(Int, Double)
    */
    func testIntDoubleAddition()
    {
        var totalIntDouble = integerValue + doubleValue
        XCTAssertNotNil(totalIntDouble)
        XCTAssertEqual(11.34567890123456, totalIntDouble)
    }
    
    /*
    Function tests CalculationUtility.+(Double, Int)
    */
    func testDoubleIntAddition()
    {
        var totalDoubleInt = doubleValue + integerValue
        XCTAssertNotNil(totalDoubleInt)
        XCTAssertEqual(11.34567890123456, totalDoubleInt)
    }
    
    /*
    Function tests CalculationUtility.+(Int, Float)
    */
    func testIntFloatAddition()
    {
        var totalIntFloat = integerValue + floatValue
        XCTAssertNotNil(totalIntFloat)
        XCTAssertEqual(Float(11), totalIntFloat)
    }
    
    /*
    Function tests CalculationUtility.+(Float, Int)
    */
    func testFloatIntAddition()
    {
        var totalFloatInt = floatValue + integerValue
        XCTAssertNotNil(totalFloatInt)
        XCTAssertEqual(Float(11), totalFloatInt)
    }
    
    /*
    Function tests CalculationUtility.+(Float, Double)
    */
    func testFloatDoubleAddition()
    {
        var totalFloatDouble = floatValue + doubleValue
        XCTAssertNotNil(totalFloatDouble)
        XCTAssertEqualWithAccuracy(2.34567890123456, totalFloatDouble, accuracy)
    }
    
    /*
    Function tests CalculationUtility.+(Double, Float)
    */
    func testDoubleFloatAddition()
    {
        var totalDoubleFloat = doubleValue + floatValue
        XCTAssertNotNil(totalDoubleFloat)
        XCTAssertEqualWithAccuracy(2.34567890123456, totalDoubleFloat, accuracy)
    }
    
    /*
    Function tests CalculationUtility.+(UInt, Double)
    */
    func testUIntDoubleAddition()
    {
        var totalUIntDouble = uIntValue + doubleValue
        XCTAssertNotNil(totalUIntDouble)
        XCTAssertEqualWithAccuracy(1235.34567890123456, totalUIntDouble, accuracy)
    }
    
    /*
    Function tests CalculationUtility.+(Double, UInt)
    */
    func testDoubleUIntAddition()
    {
        var totalDoubleUIntValue = doubleValue + uIntValue
        XCTAssertNotNil(totalDoubleUIntValue)
        XCTAssertEqualWithAccuracy(1235.34567890123456, totalDoubleUIntValue, accuracy)
    }
    
    /*
    Function tests CalculationUtility.+(UInt, Float)
    */
    func testUIntFloatAddition()
    {
        var totalUIntFloat = uIntValue + floatValue
        XCTAssertNotNil(totalUIntFloat)
        XCTAssertEqual(Float(1235.0), totalUIntFloat)
    }
    
    /*
    Function tests CalculationUtility.+(Float, UInt)
    */
    func testFloatUIntAddition()
    {
        var totalFloatUIntValue = floatValue + uIntValue
        XCTAssertNotNil(totalFloatUIntValue)
        XCTAssertEqual(Float(1235.0), totalFloatUIntValue)
    }
    
    /*
    Function tests CalculationUtility.-(Int, Double)
    */
    func testIntDoubleSubtraction()
    {
        var totalIntDoubleValue = integerValue - doubleValue
        XCTAssertNotNil(totalIntDoubleValue)
        XCTAssertEqualWithAccuracy(8.65432109876544, totalIntDoubleValue, accuracy)
    }
    
    /*
    Function tests CalculationUtility.-(Double, Int)
    */
    func testDoublIntSubtraction()
    {
        var totalDoubleIntValue = doubleValue - integerValue
        XCTAssertNotNil(totalDoubleIntValue)
        XCTAssertEqualWithAccuracy(-8.65432109876544, totalDoubleIntValue, accuracy)
    }
    
    /*
    Function tests CalculationUtility.-(Int, Float)
    */
    func testIntFloatSubtraction()
    {
        var totalIntFloatValue = integerValue - floatValue
        XCTAssertNotNil(totalIntFloatValue)
        XCTAssertEqual(Float(9), totalIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility.-(Float, Int)
    */
    func testFloatIntSubtraction()
    {
        var totalFloatIntValue = floatValue - integerValue
        XCTAssertNotNil(totalFloatIntValue)
        XCTAssertEqual(Float(-9), totalFloatIntValue)
    }
    
    /*
    Function tests CalculationUtility.-(Float, Double)
    */
    func testFloatDoubleSubtraction()
    {
        var totalFloatDoubleValue = floatValue - doubleValue
        XCTAssertNotNil(totalFloatDoubleValue)
        XCTAssertEqualWithAccuracy(-0.34567890123456, totalFloatDoubleValue, accuracy)
    }
    
    /*
    Function tests CalculationUtility.-(Double, Float)
    */
    func testDoubleFloatSubtraction()
    {
        var totalDoubleFloatValue = doubleValue - floatValue
        XCTAssertNotNil(totalDoubleFloatValue)
        XCTAssertEqualWithAccuracy(0.34567890123456, totalDoubleFloatValue, accuracy)
    }
    
    /*
    Function tests CalculationUtility.-(UInt, Double)
    */
    func testUIntDoubleSubtraction()
    {
        var totalUIntDoubleValue = uIntValue - doubleValue
        XCTAssertNotNil(totalUIntDoubleValue)
        XCTAssertEqualWithAccuracy(1232.65432109876544, totalUIntDoubleValue, accuracy)
    }
    
    /*
    Function tests CalculationUtility.-(Double, UInt)
    */
    func testDoubleUIntSubtraction()
    {
        var totalDoubleUIntValue = doubleValue - uIntValue
        XCTAssertNotNil(totalDoubleUIntValue)
        XCTAssertEqualWithAccuracy(-1232.65432109876544, totalDoubleUIntValue, accuracy)
    }
    
    /*
    Function tests CalculationUtility.-(UInt, Float)
    */
    func testUIntFloatSubtraction()
    {
        var totalUIntFloatValue = uIntValue - floatValue
        XCTAssertNotNil(totalUIntFloatValue)
        XCTAssertEqual(Float(1233), totalUIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility.-(Float, UInt)
    */
    func testFloatUIntSubtraction()
    {
        var totalFloatUIntValue = floatValue - uIntValue
        XCTAssertNotNil(totalFloatUIntValue)
        XCTAssertEqual(Float(-1233), totalFloatUIntValue)
    }
    
    /*
    Function tests CalculationUtility.*(Int, Double)
    */
    func testIntDoubleMultiplication()
    {
        var totalIntDoubleValue = integerValue * doubleValue
        XCTAssertNotNil(totalIntDoubleValue)
        XCTAssertEqualWithAccuracy(13.4567890123456, totalIntDoubleValue, accuracy)
    }
    
    /*
    Function tests CalculationUtility.*(Double, Int)
    */
    func testDoubleIntMultiplication()
    {
        var totalDoubleIntValue = doubleValue * integerValue
        XCTAssertNotNil(totalDoubleIntValue)
        XCTAssertEqualWithAccuracy(13.4567890123456, totalDoubleIntValue, accuracy)
    }
    
    /*
    Function tests CalculationUtility.*(Int, Float)
    */
    func testIntFloatMultiplication()
    {
        var totalIntFloatValue = integerValue * floatValue
        XCTAssertNotNil(totalIntFloatValue)
        XCTAssertEqual(Float(10), totalIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility.*(Float, Int)
    */
    func testFloatIntMultiplication()
    {
        var totalFloatIntValue = floatValue * integerValue
        XCTAssertNotNil(totalFloatIntValue)
        XCTAssertEqual(Float(10), totalFloatIntValue)
    }
    
    func testFloatDoubleMultiplication()
    {
        var totalFloatDoubleValue = floatValue * doubleValue
        XCTAssertNotNil(totalFloatDoubleValue)
        XCTAssertEqualWithAccuracy(1.34567890123456, totalFloatDoubleValue, accuracy)
    }
    
    func testDoubleFloatMultiplication()
    {
        var totalDoubleFloatValue = doubleValue * floatValue
        XCTAssertNotNil(totalDoubleFloatValue)
        XCTAssertEqualWithAccuracy(1.34567890123456, totalDoubleFloatValue, accuracy)
    }
    
    /*
    The testPerformanceExample tests the performance of all CalculationUtility class functions
    */
    func testPerformanceExample()
    {
        /* This is an example of a performance test case. */
        self.measureBlock()
        {
            self.testSumOfInt()
            self.testSumOfDouble()
            self.testIntDoubleAddition()
            self.testDoubleIntAddition()
            self.testIntFloatAddition()
            self.testFloatIntAddition()
            self.testFloatDoubleAddition()
            self.testDoubleFloatAddition()
            self.testUIntDoubleAddition()
            self.testDoubleUIntAddition()
            self.testUIntFloatAddition()
            self.testFloatUIntAddition()
            self.testIntDoubleSubtraction()
            self.testDoublIntSubtraction()
            self.testIntFloatSubtraction()
            self.testFloatIntSubtraction()
            self.testFloatDoubleSubtraction()
            self.testDoubleFloatSubtraction()
            self.testUIntDoubleSubtraction()
            self.testDoubleUIntSubtraction()
            self.testUIntFloatSubtraction()
            self.testFloatUIntSubtraction()
            self.testIntDoubleMultiplication()
            self.testDoubleIntMultiplication()
            self.testIntFloatMultiplication()
            self.testFloatIntMultiplication()
            self.testFloatDoubleMultiplication()
            self.testDoubleFloatMultiplication()
        }
    }
    
}
