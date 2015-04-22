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
import CoreGraphics
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
    private var uIntValue:UInt = 1234
    private var cgFloatValue:CGFloat = 2.0
    
    let ACCURACY = 0.00000001
    let ACCURACY_CGFLOAT:CGFloat = 0.00000001
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
    
    //MARK: ###########################Summation Functions###########################
    
    /*
    Tests Summation functions
    */
    func testSumOfInt()
    {
        let sum1 = ∑([1, 2, 3])
        let sum2 = sumOf(1, 2, 3)
        
        let arr = [1, 2, 3]
        let sum3 = ∑(arr)
        
        let sum4 = sumOf(arr)
        let sum5 = sumOf(arr[0...1])
        
        XCTAssertEqual(6, sum1)
        XCTAssertEqual(6, sum2)
        XCTAssertEqual(6, sum3)
        XCTAssertEqual(6, sum4)
        XCTAssertEqual(3, sum5)
    }
    
    /*
    Tests Summation functions
    */
    func testSumOfDouble()
    {
        let sum1 = ∑([1.1, 2.2, 3.3])
        let sum2 = sumOf(1.1, 2.2, 3.3)
        
        let arr = [1.1, 2.2, 3.3]
        let sum3 = ∑(arr)
        let sum4 = sumOf(arr)
        let sum5 = sumOf(arr[0...1])
        
        let accuracy = 1E-10
        XCTAssertEqualWithAccuracy(6.6, sum1, accuracy)
        XCTAssertEqualWithAccuracy(6.6, sum2, accuracy)
        XCTAssertEqualWithAccuracy(6.6, sum3, accuracy)
        XCTAssertEqualWithAccuracy(6.6, sum4, accuracy)
        XCTAssertEqualWithAccuracy(3.3, sum5, accuracy)
    }
    
    //MARK: ################################Factorial################################
    
    /*
    Function tests CalculationUtility.~!(T)
    */
    func testFactorial()
    {
        let factorialValue = 7~!
        XCTAssertEqual(5040, factorialValue)
    }
    
    //MARK: ###########################Multiplication Functions###########################
    
    /*
    Function test CalculationUtility.productOf
    */
    func testProduct()
    {
        let productIntValue = productOf(2, 3, 4)
        XCTAssertEqual(24, productIntValue)
        
        let productFloatValue = ∏([2.5, 4.5, 6.5, 8.5])
        XCTAssertEqual(621.5625, productFloatValue)
        
        let productZeroValue = productOf(2, 3, 4, 5, 6, 7, 8, 9, 0)
        XCTAssertEqual(0, productZeroValue)
    }
    
    //MARK: ###########Additional Functions for Calculated Numerical Values###########
    
    /*
    Function test CalculationUtility.squared(T)
    */
    func testSquared()
    {
        let threeSquared = squared(3)
        XCTAssertEqual(9, threeSquared)
        
        let tenSquared = squared(10)
        XCTAssertEqual(100, tenSquared)
    }
    
    /*
    Function test CalculationUtility.cubed(T)
    */
    func testCubed()
    {
        let threeCubed = cubed(3)
        XCTAssertEqual(27, threeCubed)
        
        let fiveCubed = cubed(5)
        XCTAssertEqual(125, fiveCubed)
    }
    
    /*
    Function test CalculationUtility.min([T])
    */
    func testMin()
    {
        let values = [1, 2, 4, 0, 9]
        let minValue = min(values)
        XCTAssertEqual(0, minValue)
    }
    
    /*
    Function test CalculationUtility.max([T])
    */
    func testMax()
    {
        let values = [101, 2, 6, 900, 2, 39, 50, 299, 10000]
        let maxValue = max(values)
        XCTAssertEqual(10000, maxValue)
    }
    
    //MARK: ####################Explicit Addition (+) Cast Functions####################
    
    /*
    Function tests CalculationUtility.+(Int, Double)
    */
    func testIntDoubleAddition()
    {
        let totalIntDouble = integerValue + doubleValue
        XCTAssertNotNil(totalIntDouble)
        XCTAssertEqual(11.34567890123456, totalIntDouble)
    }
    
    /*
    Function tests CalculationUtility.+(Double, Int)
    */
    func testDoubleIntAddition()
    {
        let totalDoubleInt = doubleValue + integerValue
        XCTAssertNotNil(totalDoubleInt)
        XCTAssertEqual(11.34567890123456, totalDoubleInt)
    }
    
    /*
    Function tests CalculationUtility.+(Int, Float)
    */
    func testIntFloatAddition()
    {
        let totalIntFloat = integerValue + floatValue
        XCTAssertNotNil(totalIntFloat)
        XCTAssertEqual(Float(11), totalIntFloat)
    }
    
    /*
    Function tests CalculationUtility.+(Float, Int)
    */
    func testFloatIntAddition()
    {
        let totalFloatInt = floatValue + integerValue
        XCTAssertNotNil(totalFloatInt)
        XCTAssertEqual(Float(11), totalFloatInt)
    }
    
    /*
    Function tests CalculationUtility.+(Float, Double)
    */
    func testFloatDoubleAddition()
    {
        let totalFloatDouble = floatValue + doubleValue
        XCTAssertNotNil(totalFloatDouble)
        XCTAssertEqualWithAccuracy(2.34567890123456, totalFloatDouble, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.+(Double, Float)
    */
    func testDoubleFloatAddition()
    {
        let totalDoubleFloat = doubleValue + floatValue
        XCTAssertNotNil(totalDoubleFloat)
        XCTAssertEqualWithAccuracy(2.34567890123456, totalDoubleFloat, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.+(UInt, Double)
    */
    func testUIntDoubleAddition()
    {
        let totalUIntDouble = uIntValue + doubleValue
        XCTAssertNotNil(totalUIntDouble)
        XCTAssertEqualWithAccuracy(1235.34567890123456, totalUIntDouble, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.+(Double, UInt)
    */
    func testDoubleUIntAddition()
    {
        let totalDoubleUIntValue = doubleValue + uIntValue
        XCTAssertNotNil(totalDoubleUIntValue)
        XCTAssertEqualWithAccuracy(1235.34567890123456, totalDoubleUIntValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.+(UInt, Float)
    */
    func testUIntFloatAddition()
    {
        let totalUIntFloat = uIntValue + floatValue
        XCTAssertNotNil(totalUIntFloat)
        XCTAssertEqual(Float(1235.0), totalUIntFloat)
    }
    
    /*
    Function tests CalculationUtility.+(Float, UInt)
    */
    func testFloatUIntAddition()
    {
        let totalFloatUIntValue = floatValue + uIntValue
        XCTAssertNotNil(totalFloatUIntValue)
        XCTAssertEqual(Float(1235.0), totalFloatUIntValue)
    }
    
    //MARK: ####################Explicit Subtraction (-) Cast Functions####################
    
    /*
    Function tests CalculationUtility.-(Int, Double)
    */
    func testIntDoubleSubtraction()
    {
        let totalIntDoubleValue = integerValue - doubleValue
        XCTAssertNotNil(totalIntDoubleValue)
        XCTAssertEqualWithAccuracy(8.65432109876544, totalIntDoubleValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.-(Double, Int)
    */
    func testDoublIntSubtraction()
    {
        let totalDoubleIntValue = doubleValue - integerValue
        XCTAssertNotNil(totalDoubleIntValue)
        XCTAssertEqualWithAccuracy(-8.65432109876544, totalDoubleIntValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.-(Int, Float)
    */
    func testIntFloatSubtraction()
    {
        let totalIntFloatValue = integerValue - floatValue
        XCTAssertNotNil(totalIntFloatValue)
        XCTAssertEqual(Float(9), totalIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility.-(Float, Int)
    */
    func testFloatIntSubtraction()
    {
        let totalFloatIntValue = floatValue - integerValue
        XCTAssertNotNil(totalFloatIntValue)
        XCTAssertEqual(Float(-9), totalFloatIntValue)
    }
    
    /*
    Function tests CalculationUtility.-(Float, Double)
    */
    func testFloatDoubleSubtraction()
    {
        let totalFloatDoubleValue = floatValue - doubleValue
        XCTAssertNotNil(totalFloatDoubleValue)
        XCTAssertEqualWithAccuracy(-0.34567890123456, totalFloatDoubleValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.-(Double, Float)
    */
    func testDoubleFloatSubtraction()
    {
        let totalDoubleFloatValue = doubleValue - floatValue
        XCTAssertNotNil(totalDoubleFloatValue)
        XCTAssertEqualWithAccuracy(0.34567890123456, totalDoubleFloatValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.-(UInt, Double)
    */
    func testUIntDoubleSubtraction()
    {
        let totalUIntDoubleValue = uIntValue - doubleValue
        XCTAssertNotNil(totalUIntDoubleValue)
        XCTAssertEqualWithAccuracy(1232.65432109876544, totalUIntDoubleValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.-(Double, UInt)
    */
    func testDoubleUIntSubtraction()
    {
        let totalDoubleUIntValue = doubleValue - uIntValue
        XCTAssertNotNil(totalDoubleUIntValue)
        XCTAssertEqualWithAccuracy(-1232.65432109876544, totalDoubleUIntValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.-(UInt, Float)
    */
    func testUIntFloatSubtraction()
    {
        let totalUIntFloatValue = uIntValue - floatValue
        XCTAssertNotNil(totalUIntFloatValue)
        XCTAssertEqual(Float(1233), totalUIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility.-(Float, UInt)
    */
    func testFloatUIntSubtraction()
    {
        let totalFloatUIntValue = floatValue - uIntValue
        XCTAssertNotNil(totalFloatUIntValue)
        XCTAssertEqual(Float(-1233), totalFloatUIntValue)
    }
    
    //MARK: ####################Explicit Multiplication (*) Cast Functions####################
    
    /*
    Function tests CalculationUtility.*(Int, Double)
    */
    func testIntDoubleMultiplication()
    {
        let totalIntDoubleValue = integerValue * doubleValue
        XCTAssertNotNil(totalIntDoubleValue)
        XCTAssertEqualWithAccuracy(13.4567890123456, totalIntDoubleValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.*(Double, Int)
    */
    func testDoubleIntMultiplication()
    {
        let totalDoubleIntValue = doubleValue * integerValue
        XCTAssertNotNil(totalDoubleIntValue)
        XCTAssertEqualWithAccuracy(13.4567890123456, totalDoubleIntValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.*(Int, Float)
    */
    func testIntFloatMultiplication()
    {
        let totalIntFloatValue = integerValue * floatValue
        XCTAssertNotNil(totalIntFloatValue)
        XCTAssertEqual(Float(10), totalIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility.*(Float, Int)
    */
    func testFloatIntMultiplication()
    {
        let totalFloatIntValue = floatValue * integerValue
        XCTAssertNotNil(totalFloatIntValue)
        XCTAssertEqual(Float(10), totalFloatIntValue)
    }
    
    /*
    Function tests CalculationUtility.*(Float, Double)
    */
    func testFloatDoubleMultiplication()
    {
        let totalFloatDoubleValue = floatValue * doubleValue
        XCTAssertNotNil(totalFloatDoubleValue)
        XCTAssertEqualWithAccuracy(1.34567890123456, totalFloatDoubleValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.*(Double, Float)
    */
    func testDoubleFloatMultiplication()
    {
        let totalDoubleFloatValue = doubleValue * floatValue
        XCTAssertNotNil(totalDoubleFloatValue)
        XCTAssertEqualWithAccuracy(1.34567890123456, totalDoubleFloatValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.*(UInt, Double)
    */
    func testUIntDoubleMultiplication()
    {
        let totalUIntDoubleValue = uIntValue * doubleValue
        XCTAssertNotNil(totalUIntDoubleValue)
        XCTAssertEqualWithAccuracy(1660.56776412344704, totalUIntDoubleValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.*(Double, UInt)
    */
    func testDoubleUIntMultiplication()
    {
        let totalDoubleUIntValue = doubleValue * uIntValue
        XCTAssertNotNil(totalDoubleUIntValue)
        XCTAssertEqualWithAccuracy(1660.56776412344704, totalDoubleUIntValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.*(UInt, Float)
    */
    func testUIntFloatMultiplication()
    {
        let totalUIntFloatValue = uIntValue * floatValue
        XCTAssertNotNil(totalUIntFloatValue)
        XCTAssertEqual(Float(1234), totalUIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility.*(Float, UInt)
    */
    func testFloatUIntMultiplication()
    {
        let totalFloatUIntValue = floatValue * uIntValue
        XCTAssertNotNil(totalFloatUIntValue)
        XCTAssertEqual(Float(1234), totalFloatUIntValue)
    }
    
    //MARK: ####################Explicit Division (/) Cast Functions####################
    
    /*
    Function tests CalculationUtility./(Int, Double)
    */
    func testIntDoubleDivision()
    {
        let totalIntDoubleValue = integerValue / doubleValue
        XCTAssertNotNil(totalIntDoubleValue)
        XCTAssertEqualWithAccuracy(7.43119327413527, totalIntDoubleValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility./(Double, Int)
    */
    func testDoubleIntDivision()
    {
        let totalDoubleIntValue = doubleValue / integerValue
        XCTAssertNotNil(totalDoubleIntValue)
        XCTAssertEqualWithAccuracy(0.13456789012346, totalDoubleIntValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility./(Int, Float)
    */
    func testIntFloatDivision()
    {
        let totalIntFloatValue = integerValue / floatValue
        XCTAssertNotNil(totalIntFloatValue)
        XCTAssertEqual(Float(10), totalIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility./(Float, Int)
    */
    func testFloatIntDivision()
    {
        let totalFloatIntValue = floatValue / integerValue
        XCTAssertNotNil(totalFloatIntValue)
        XCTAssertEqual(Float(0.1), totalFloatIntValue)
    }
    
    /*
    Function tests CalculationUtility./(Float, Double)
    */
    func testFloatDoubleDivision()
    {
        let totalFloatDoubleValue = floatValue / doubleValue
        XCTAssertNotNil(totalFloatDoubleValue)
        XCTAssertEqualWithAccuracy(0.74311932741353, totalFloatDoubleValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility./(Double, Float)
    */
    func testDoubleFloatDivision()
    {
        let totalDoubleFloatValue = doubleValue / floatValue
        XCTAssertNotNil(totalDoubleFloatValue)
        XCTAssertEqualWithAccuracy(1.34567890123456, totalDoubleFloatValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility./(UInt, Double)
    */
    func testUIntDoubleDivision()
    {
        let totalUIntDoubleValue = uIntValue / doubleValue
        XCTAssertNotNil(totalUIntDoubleValue)
        XCTAssertEqualWithAccuracy(917.00925002829208, totalUIntDoubleValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility./(Double, UInt)
    */
    func testDoubleUIntDivision()
    {
        let totalDoubleUIntValue = doubleValue / uIntValue
        XCTAssertNotNil(totalDoubleUIntValue)
        XCTAssertEqualWithAccuracy(0.00109050154071, totalDoubleUIntValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility./(UInt, Float)
    */
    func testUIntFloatDivision()
    {
        let totalUIntFloatValue = uIntValue / floatValue
        XCTAssertNotNil(totalUIntFloatValue)
        XCTAssertEqual(Float(1234), totalUIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility./(Float, UInt)
    */
    func testFloatUIntDivision()
    {
        let totalFloatUIntValue = floatValue / uIntValue
        XCTAssertNotNil(totalFloatUIntValue)
        XCTAssertEqual(Float(0.00081037277147), totalFloatUIntValue)
    }

    //MARK: ####################Explicit Modulus (%) Cast Functions####################
    
    /*
    Function tests CalculationUtility.%(Int, Double)
    */
    func testIntDoubleModulus()
    {
        let totalIntDoubleValue = integerValue % doubleValue
        XCTAssertNotNil(totalIntDoubleValue)
        XCTAssertEqualWithAccuracy(0.58024769135808, totalIntDoubleValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.%(Double, Int)
    */
    func testDoubleIntModulus()
    {
        let totalDoubleIntValue = doubleValue % integerValue
        XCTAssertNotNil(totalDoubleIntValue)
        XCTAssertEqualWithAccuracy(1.34567890123456, totalDoubleIntValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.%(Int, Float)
    */
    func testIntFloatModulus()
    {
        let totalIntFloatValue = integerValue % Float(3)
        XCTAssertNotNil(totalIntFloatValue)
        XCTAssertEqual(Float(1), totalIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility.%(Float, Int)
    */
    func testFloatIntModulus()
    {
        let totalFloatIntValue = Float(20) % 3
        XCTAssertNotNil(totalFloatIntValue)
        XCTAssertEqual(Float(2), totalFloatIntValue)
    }
    
    /*
    Function tests CalculationUtility.%(Float, Double)
    */
    func testFloatDoubleModulus()
    {
        let totalFloatDoubleValue = 20.0 % 3.00001
        XCTAssertNotNil(totalFloatDoubleValue)
        XCTAssertEqualWithAccuracy(1.99994, totalFloatDoubleValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.%(Double, Float)
    */
    func testDoubleFloatModulus()
    {
        let totalDoubleFloatValue = 3.0000001 % 2.0
        XCTAssertNotNil(totalDoubleFloatValue)
        XCTAssertEqualWithAccuracy(1.0000001, totalDoubleFloatValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.%(UInt, Double)
    */
    func testUIntDoubleModulus()
    {
        let totalUIntDoubleValue = 18 % 5.00001
        XCTAssertNotNil(totalUIntDoubleValue)
        XCTAssertEqualWithAccuracy(2.99997, totalUIntDoubleValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.%(Double, UInt)
    */
    func testDoubleUIntModulus()
    {
        let totalDoubleUIntValue = 5.00001 % 2
        XCTAssertNotNil(totalDoubleUIntValue)
        XCTAssertEqualWithAccuracy(1.00001, totalDoubleUIntValue, ACCURACY)
    }
    
    /*
    Function tests CalculationUtility.%(UInt, Float)
    */
    func testUIntFloatModulus()
    {
        let totalUIntFloatValue = 18 % Float(5.0)
        XCTAssertNotNil(totalUIntFloatValue)
        XCTAssertEqual(Float(3), totalUIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility.%(Float, UInt)
    */
    func testFloatUIntModulus()
    {
        let totalFloatUIntValue = Float(5.0) % 2
        XCTAssertNotNil(totalFloatUIntValue)
        XCTAssertEqual(Float(1), totalFloatUIntValue)
    }
    
    //MARK: ####################Explicit Less Than (<) Cast Functions####################
    
    /*
    Function tests CalculationUtility.<(Int, Double)
    */
    func testIntDoubleLessThan()
    {
        var totalIntDoubleValue = 5 < 5.001
        XCTAssertTrue(totalIntDoubleValue)
        
        totalIntDoubleValue = 5.1 < 5.01111
        XCTAssertFalse(totalIntDoubleValue)
    }
    
    /*
    Function tests CalculationUtility.<(Double, Int)
    */
    func testDoubleIntLessThan()
    {
        var totalDoubleIntValue = 5.99999 < 6
        XCTAssertTrue(totalDoubleIntValue)
        
        totalDoubleIntValue = 6.0000001 < 6
        XCTAssertFalse(totalDoubleIntValue)
    }
    
    /*
    Function tests CalculationUtility.<(Int, Float)
    */
    func testIntFloatLessThan()
    {
        var totalIntFloatLessThan = 5 < Float(5.0001)
        XCTAssertTrue(totalIntFloatLessThan)
        
        totalIntFloatLessThan = 5 < Float(4.999)
        XCTAssertFalse(totalIntFloatLessThan)
    }
    
    /*
    Function tests CalculationUtility.<(Float, Int)
    */
    func testFloatIntLessThan()
    {
        var totalFloatIntLessThan = Float(4.9) < 5
        XCTAssertTrue(totalFloatIntLessThan)
        
        totalFloatIntLessThan = Float(5.01) < 5
        XCTAssertFalse(totalFloatIntLessThan)
    }
    
    /*
    Function tests CalculationUtility.<(Float, Double)
    */
    func testFloatDoubleLessThan()
    {
        var totalFloatDoubleLessThan = Float(4.9) < 5.0000001
        XCTAssertTrue(totalFloatDoubleLessThan)
        
        totalFloatDoubleLessThan = Float(5.01) < 5.001
        XCTAssertFalse(totalFloatDoubleLessThan)
    }
    
    /*
    Function tests CalculationUtility.<(Double, Float)
    */
    func testDoubleFloatLessThan()
    {
        var totalDoubleFloatLessThan = 5.1 < Float(5.01)
        XCTAssertFalse(totalDoubleFloatLessThan)
        
        totalDoubleFloatLessThan = 5.000001 < Float(5.1)
        XCTAssertTrue(totalDoubleFloatLessThan)
    }
    
    /*
    Function tests CalculationUtility.<(UInt, Double)
    */
    func testUIntDoubleLessThan()
    {
        let uIntValue:UInt = 12
        var totalUIntDoubleValue = uIntValue < 12.000001
        XCTAssertTrue(totalUIntDoubleValue)
        
        totalUIntDoubleValue = uIntValue < 11.999999999
        XCTAssertFalse(totalUIntDoubleValue)
    }
    
    /*
    Function tests CalculationUtility.<(Double, UInt)
    */
    func testDoubleUIntLessThan()
    {
        let uIntValue:UInt = 12
        var totalDoubleUIntValue = 12.0000001 < uIntValue
        XCTAssertFalse(totalDoubleUIntValue)
        
        totalDoubleUIntValue = 11.999991 < uIntValue
        XCTAssertTrue(totalDoubleUIntValue)
    }
    
    /*
    Function tests CalculationUtility.<(UInt, Float)
    */
    func testUIntFloatLessThan()
    {
        let uIntValue:UInt = 12
        var totalUIntFloatValue = uIntValue < Float(12.01)
        XCTAssertTrue(totalUIntFloatValue)
        
        totalUIntFloatValue = uIntValue < Float(11.999991)
        XCTAssertFalse(totalUIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility.<(Float, UInt)
    */
    func testFloatUIntLessThan()
    {
        let uIntValue:UInt = 12
        var totalFloatUIntValue = Float(12.01) < uIntValue
        XCTAssertFalse(totalFloatUIntValue)
        
        totalFloatUIntValue = Float(11.99) < uIntValue
        XCTAssertTrue(totalFloatUIntValue)
    }
    
    //MARK: ####################Explicit Greater Than (>) Cast Functions####################
    
    /*
    Function tests CalculationUtility.>(Int, Double)
    */
    func testIntDoubleGreaterThan()
    {
        var totalIntDoubleValue = 5 > 5.001
        XCTAssertFalse(totalIntDoubleValue)
        
        totalIntDoubleValue = 5 > 4.999991
        XCTAssertTrue(totalIntDoubleValue)
    }
    
    /*
    Function tests CalculationUtility.>(Double, Int)
    */
    func testDoubleIntGreaterThan()
    {
        var totalDoubleIntValue = 5.99999 > 6
        XCTAssertFalse(totalDoubleIntValue)
        
        totalDoubleIntValue = 6.0000001 > 6
        XCTAssertTrue(totalDoubleIntValue)
    }
    
    /*
    Function tests CalculationUtility.>(Int, Float)
    */
    func testIntFloatGreaterThan()
    {
        var totalIntFloatLessThan = 5 > Float(5.0001)
        XCTAssertFalse(totalIntFloatLessThan)
        
        totalIntFloatLessThan = 5 > Float(4.999)
        XCTAssertTrue(totalIntFloatLessThan)
    }
    
    /*
    Function tests CalculationUtility.>(Float, Int)
    */
    func testFloatIntGreaterThan()
    {
        var totalFloatIntLessThan = Float(4.9) > 5
        XCTAssertFalse(totalFloatIntLessThan)
        
        totalFloatIntLessThan = Float(5.01) > 5
        XCTAssertTrue(totalFloatIntLessThan)
    }
    
    /*
    Function tests CalculationUtility.>(Float, Double)
    */
    func testFloatDoubleGreaterThan()
    {
        var totalFloatDoubleLessThan = Float(4.9) > 5.0000001
        XCTAssertFalse(totalFloatDoubleLessThan)
        
        totalFloatDoubleLessThan = Float(5.01) > 5.001
        XCTAssertTrue(totalFloatDoubleLessThan)
    }
    
    /*
    Function tests CalculationUtility.>(Double, Float)
    */
    func testDoubleFloatGreaterThan()
    {
        var totalDoubleFloatLessThan = 5.1 > Float(5.01)
        XCTAssertTrue(totalDoubleFloatLessThan)
        
        totalDoubleFloatLessThan = 5.00001 > Float(5.0001)
        XCTAssertFalse(totalDoubleFloatLessThan)
    }
    
    /*
    Function tests CalculationUtility.>(UInt, Double)
    */
    func testUIntDoubleGreaterThan()
    {
        let uIntValue:UInt = 12
        var totalUIntDoubleValue = uIntValue > 12.000001
        XCTAssertFalse(totalUIntDoubleValue)
        
        totalUIntDoubleValue = uIntValue > 11.99999999
        XCTAssertTrue(totalUIntDoubleValue)
    }
    
    /*
    Function tests CalculationUtility.>(Double, UInt)
    */
    func testDoubleUIntGreaterThan()
    {
        let uIntValue:UInt = 12
        var totalDoubleUIntValue = 12.0000001 > uIntValue
        XCTAssertTrue(totalDoubleUIntValue)
        
        totalDoubleUIntValue = 11.9999999 > uIntValue
        XCTAssertFalse(totalDoubleUIntValue)
    }
    
    /*
    Function tests CalculationUtility.>(UInt, Float)
    */
    func testUIntFloatGreaterThan()
    {
        let uIntValue:UInt = 12
        var totalUIntFloatValue = uIntValue > Float(12.01)
        XCTAssertFalse(totalUIntFloatValue)
        
        totalUIntFloatValue = uIntValue > Float(11.99)
        XCTAssertTrue(totalUIntFloatValue)
    }
    
    /*
    Function tests CalculationUtility.>(Float, UInt)
    */
    func testFloatUIntGreaterThan()
    {
        let uIntValue:UInt = 12
        var totalFloatUIntValue = Float(12.01) > uIntValue
        XCTAssertTrue(totalFloatUIntValue)
        
        totalFloatUIntValue = Float(11.99) > uIntValue
        XCTAssertFalse(totalFloatUIntValue)
    }
    
    //MARK: ##################Explicit CGFloat Addition (+) Cast Functions##################
    
    /*
    Function tests CalculationUtility.+(CGFloat, Float)
    */
    func testCGFloatFloatAddition()
    {
        let totalCGFloatFloatValue = cgFloatValue + floatValue
        XCTAssertNotNil(totalCGFloatFloatValue)
        XCTAssertEqual(CGFloat(3), totalCGFloatFloatValue)
    }
    
    /*
    Function tests CalculationUtility.+(Float, CGFloat)
    */
    func testFloatCGFloatAddition()
    {
        let totalFloatCGFloatValue = floatValue + cgFloatValue
        XCTAssertNotNil(totalFloatCGFloatValue)
        XCTAssertEqual(CGFloat(3), totalFloatCGFloatValue)
    }
    
    /*
    Function tests CalculationUtility.+(CGFloat, Double)
    */
    func testCGFloatDoubleAddition()
    {
        let totalCGFloatDoubleValue = cgFloatValue + doubleValue
        XCTAssertNotNil(totalCGFloatDoubleValue)
        XCTAssertEqualWithAccuracy(CGFloat(3.34567890123456), totalCGFloatDoubleValue, ACCURACY_CGFLOAT)
    }
    
    /*
    Function tests CalculationUtility.+(Double, CGFloat)
    */
    func testDoubleCGFloatAddition()
    {
        let totalDoubleCGFloatValue = doubleValue + cgFloatValue
        XCTAssertNotNil(totalDoubleCGFloatValue)
        XCTAssertEqualWithAccuracy(CGFloat(3.34567890123456), totalDoubleCGFloatValue, ACCURACY_CGFLOAT)
    }
    
    /*
    Function tests CalculationUtility.+(CGFloat, Int)
    */
    func testCGFloatIntAddition()
    {
        let totalCGFloatIntValue = cgFloatValue + integerValue
        XCTAssertNotNil(totalCGFloatIntValue)
        XCTAssertEqual(CGFloat(12.0), totalCGFloatIntValue)
    }
    
    /*
    Function tests CalculationUtility.+(Int, CGFloat)
    */
    func testIntCGFloatAddition()
    {
        let totalIntCGFloatValue = integerValue + cgFloatValue
        XCTAssertNotNil(totalIntCGFloatValue)
        XCTAssertEqual(CGFloat(12.0), totalIntCGFloatValue)
    }
    
    /*
    Function tests CalculationUtility.+(CGFloat, UInt)
    */
    func testCGFloatUIntAddition()
    {
        let totalCGFloatUIntValue = cgFloatValue + uIntValue
        XCTAssertNotNil(totalCGFloatUIntValue)
        XCTAssertEqual(CGFloat(1236), totalCGFloatUIntValue)
    }
    
    /*
    Function tests CalculationUtility.+(UInt, CGFloat)
    */
    func testUIntCGFloatAddition()
    {
        let totalUIntCGFloatValue = uIntValue + cgFloatValue
        XCTAssertNotNil(totalUIntCGFloatValue)
        XCTAssertEqual(CGFloat(1236), totalUIntCGFloatValue)
    }
    
    //MARK: ##################Explicit CGFloat Subtraction (-) Cast Functions##################
    
    /*
    Function tests CalculationUtility.-(CGFloat, Float)
    */
    func testCGFloatFloatSubtraction()
    {
        let totalCGFloatFloatValue = cgFloatValue - floatValue
        XCTAssertNotNil(totalCGFloatFloatValue)
        XCTAssertEqual(CGFloat(1), totalCGFloatFloatValue)
    }
    
    /*
    Function tests CalculationUtility.-(Float, CGFloat)
    */
    func testFloatCGFloatSubtraction()
    {
        let totalFloatCGFloatValue = floatValue - cgFloatValue
        XCTAssertNotNil(totalFloatCGFloatValue)
        XCTAssertEqual(CGFloat(-1), totalFloatCGFloatValue)
    }
    
    /*
    Function tests CalculationUtility.-(CGFloat, Double)
    */
    func testCGFloatDoubleSubtraction()
    {
        let totalCGFloatDoubleValue = cgFloatValue - doubleValue
        XCTAssertNotNil(totalCGFloatDoubleValue)
        XCTAssertEqualWithAccuracy(CGFloat(0.65432109876544), totalCGFloatDoubleValue, ACCURACY_CGFLOAT)
    }
    
    /*
    Function tests CalculationUtility.-(Double, CGFloat)
    */
    func testDoubleCGFloatSubtraction()
    {
        let totalDoubleCGFloatValue = doubleValue - cgFloatValue
        XCTAssertNotNil(totalDoubleCGFloatValue)
        XCTAssertEqualWithAccuracy(CGFloat(-0.65432109876544), totalDoubleCGFloatValue, ACCURACY_CGFLOAT)
    }
    
    /*
    Function tests CalculationUtility.-(CGFloat, Int)
    */
    func testCGFloatIntSubtraction()
    {
        let totalCGFloatIntValue = cgFloatValue - integerValue
        XCTAssertNotNil(totalCGFloatIntValue)
        XCTAssertEqual(CGFloat(-8), totalCGFloatIntValue)
    }
    
    /*
    Function tests CalculationUtility.-(Int, CGFloat)
    */
    func testIntCGFloatSubtraction()
    {
        let totalIntCGFloatValue = integerValue - cgFloatValue
        XCTAssertNotNil(totalIntCGFloatValue)
        XCTAssertEqual(CGFloat(8), totalIntCGFloatValue)
    }

    /*
    Function tests CalculationUtility.-(CGFloat, UInt)
    */
    func testCGFloatUIntSubtraction()
    {
        let totalCGFloatUIntValue = cgFloatValue - uIntValue
        XCTAssertNotNil(totalCGFloatUIntValue)
        XCTAssertEqual(CGFloat(-1232), totalCGFloatUIntValue)
    }
    
    /*
    Function tests CalculationUtility.-(UInt, CGFloat)
    */
    func testUIntCGFloatSubtraction()
    {
        let totalUIntCGFloatValue = uIntValue - cgFloatValue
        XCTAssertNotNil(totalUIntCGFloatValue)
        XCTAssertEqual(CGFloat(1232), totalUIntCGFloatValue)
    }
    
    //MARK: ##################Explicit CGFloat Multiplication (*) Cast Functions##################
    
    /*
    Function tests CalculationUtility.*(CGFloat, Float)
    */
    func testCGFloatFloatMultiplication()
    {
        let totalCGFloatFloatValue = cgFloatValue * floatValue
        XCTAssertNotNil(totalCGFloatFloatValue)
        XCTAssertEqual(CGFloat(2.0), totalCGFloatFloatValue)
    }
    
    /*
    Function tests CalculationUtility.*(Float, CGFloat)
    */
    func testFloatCGFloatMultiplication()
    {
        let totalFloatCGFloatValue = floatValue * cgFloatValue
        XCTAssertNotNil(totalFloatCGFloatValue)
        XCTAssertEqual(CGFloat(2.0), totalFloatCGFloatValue)
    }
    
    /*
    Function tests CalculationUtility.*(CGFloat, Double)
    */
    func testCGFloatDoubleMultiplication()
    {
        let totalCGFloatDoubleValue = cgFloatValue * doubleValue
        XCTAssertNotNil(totalCGFloatDoubleValue)
        XCTAssertEqual(CGFloat(2.69135780246912), totalCGFloatDoubleValue)
    }
    
    /*
    Function tests CalculationUtility.*(Double, CGFloat)
    */
    func testDoubleCGFloatMultiplication()
    {
        let totalDoulbeCGFloatValue = doubleValue * cgFloatValue
        XCTAssertNotNil(totalDoulbeCGFloatValue)
        XCTAssertEqual(CGFloat(2.69135780246912), totalDoulbeCGFloatValue)
    }
    
    /*
    Function tests CalculationUtility.*(CGFloat, Int)
    */
    func testCGFloatIntMultiplication()
    {
        let totalCGFloatIntValue = cgFloatValue * integerValue
        XCTAssertNotNil(totalCGFloatIntValue)
        XCTAssertEqual(CGFloat(20), totalCGFloatIntValue)
    }
    
    /*
    Function tests CalculationUtility.*(Int, CGFloat)
    */
    func testIntCGFloatMultiplication()
    {
        let totalIntCGFloatValue = integerValue * cgFloatValue
        XCTAssertNotNil(totalIntCGFloatValue)
        XCTAssertEqual(CGFloat(20), totalIntCGFloatValue)
    }
    
    /*
    Function tests CalculationUtility.*(CGFloat, UInt)
    */
    func testCGFloatUIntMultiplication()
    {
        let totalCGFloatUIntValue = cgFloatValue * uIntValue
        XCTAssertNotNil(totalCGFloatUIntValue)
        XCTAssertEqual(CGFloat(2468), totalCGFloatUIntValue)
    }
    
    /*
    Function tests CalculationUtility.*(UInt, CGFloat)
    */
    func testUIntCGFloatMultiplication()
    {
        let totalUIntCGFloatValue = uIntValue * cgFloatValue
        XCTAssertNotNil(totalUIntCGFloatValue)
        XCTAssertEqual(CGFloat(2468), totalUIntCGFloatValue)
    }
    
    //MARK: ##################Explicit CGFloat Division (/) Cast Functions##################
    
    /*
    Function tests CalculationUtility./(CGFloat, Float)
    */
    func testCGFloatFloatDivision()
    {
        let totalCGFloatFloatValue = cgFloatValue / floatValue
        XCTAssertNotNil(totalCGFloatFloatValue)
        XCTAssertEqual(CGFloat(2.0), totalCGFloatFloatValue)
    }
    
    /*
    Function tests CalculationUtility./(Float, CGFloat)
    */
    func testFloatCGFloatDivision()
    {
        let totalFloatCGFloatValue = floatValue / cgFloatValue
        XCTAssertNotNil(totalFloatCGFloatValue)
        XCTAssertEqual(CGFloat(0.5), totalFloatCGFloatValue)
    }
    
    /*
    Function tests CalculationUtility./(CGFloat, Double)
    */
    func testCGFloatDoubleDivision()
    {
        let totalCGFloatDoubleValue = cgFloatValue / doubleValue
        XCTAssertNotNil(totalCGFloatDoubleValue)
        XCTAssertEqualWithAccuracy(CGFloat(1.48623865482705), totalCGFloatDoubleValue, ACCURACY_CGFLOAT)
    }
    
    /*
    Function tests CalculationUtility./(Double, CGFloat)
    */
    func testDoubleCGFloatDivision()
    {
        let totalDoubleCGFloatValue = doubleValue / cgFloatValue
        XCTAssertNotNil(totalDoubleCGFloatValue)
        XCTAssertEqualWithAccuracy(CGFloat(0.67283945061728), totalDoubleCGFloatValue, ACCURACY_CGFLOAT)
    }
    
    /*
    Function tests CalculationUtility./(CGFloat, Int)
    */
    func testCGFloatIntDivision()
    {
        let totalCGFloatIntValue = cgFloatValue / integerValue
        XCTAssertNotNil(totalCGFloatIntValue)
        XCTAssertEqual(CGFloat(0.2), totalCGFloatIntValue)
    }
    
    /*
    Function tests CalculationUtility./(Int, CGFloat)
    */
    func testIntCGFloatDivision()
    {
        let totalIntCGFloatValue = integerValue / cgFloatValue
        XCTAssertNotNil(totalIntCGFloatValue)
        XCTAssertEqual(CGFloat(5), totalIntCGFloatValue)
    }
    
    /*
    Function tests CalculationUtility./(CGFloat, UInt)
    */
    func testCGFloatUIntDivision()
    {
        let totalCGFloatUIntValue = cgFloatValue / uIntValue
        XCTAssertNotNil(totalCGFloatUIntValue)
        XCTAssertEqualWithAccuracy(CGFloat(0.00162074554294976), totalCGFloatUIntValue, ACCURACY_CGFLOAT)
    }
    
    /*
    Function tests CalculationUtility./(UInt, CGFloat)
    */
    func testUIntCGFloatDivision()
    {
        let totalUIntCGFloatValue = uIntValue / cgFloatValue
        XCTAssertNotNil(totalUIntCGFloatValue)
        XCTAssertEqual(CGFloat(617), totalUIntCGFloatValue)
    }
    
    /*
    The testPerformanceExample tests the performance of all CalculationUtility class functions
    */
    func testPerformanceExample()
    {
        /* This is an example of a performance test case. */
        self.measureBlock()
        {
            /* Test Summation Functions */
            self.testSumOfInt()
            self.testSumOfDouble()
            self.testFactorial()
            self.testProduct()
            self.testSquared()
            self.testCubed()
            self.testMin()
            /* Test + (Addition Functions) */
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
            /* Test - (Subtraction Functions) */
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
            /* Test * (Multiplication Functions) */
            self.testIntDoubleMultiplication()
            self.testDoubleIntMultiplication()
            self.testIntFloatMultiplication()
            self.testFloatIntMultiplication()
            self.testFloatDoubleMultiplication()
            self.testDoubleFloatMultiplication()
            self.testUIntDoubleMultiplication()
            self.testDoubleUIntMultiplication()
            self.testUIntFloatMultiplication()
            self.testFloatUIntMultiplication()
            /* Test / (Division Functions) */
            self.testIntDoubleDivision()
            self.testDoubleIntDivision()
            self.testIntFloatDivision()
            self.testFloatIntDivision()
            self.testFloatDoubleDivision()
            self.testDoubleFloatDivision()
            self.testUIntDoubleDivision()
            self.testDoubleUIntDivision()
            self.testUIntFloatDivision()
            self.testFloatUIntDivision()
            /* Test % (Modulus Functions) */
            self.testIntDoubleModulus()
            self.testDoubleIntModulus()
            self.testIntFloatModulus()
            self.testFloatIntModulus()
            self.testFloatDoubleModulus()
            self.testDoubleFloatModulus()
            self.testUIntDoubleModulus()
            self.testDoubleUIntModulus()
            self.testUIntFloatModulus()
            self.testFloatUIntModulus()
            /* Test < (Less Than Functions) */
            self.testIntDoubleLessThan()
            self.testDoubleIntLessThan()
            self.testIntFloatLessThan()
            self.testFloatIntLessThan()
            self.testFloatDoubleLessThan()
            self.testDoubleFloatLessThan()
            self.testUIntDoubleLessThan()
            self.testDoubleUIntLessThan()
            self.testUIntFloatLessThan()
            self.testFloatUIntLessThan()
            /* Test > (Greater Than Functions) */
            self.testIntDoubleGreaterThan()
            self.testDoubleIntGreaterThan()
            self.testIntFloatGreaterThan()
            self.testFloatIntGreaterThan()
            self.testFloatDoubleGreaterThan()
            self.testDoubleFloatGreaterThan()
            self.testUIntDoubleGreaterThan()
            self.testDoubleUIntGreaterThan()
            self.testUIntFloatGreaterThan()
            self.testFloatUIntGreaterThan()
            /* Test + (CGFloat Add Functions) */
            self.testCGFloatFloatAddition()
            self.testFloatCGFloatAddition()
            self.testCGFloatDoubleAddition()
            self.testDoubleCGFloatAddition()
            self.testCGFloatIntAddition()
            self.testIntCGFloatAddition()
            self.testCGFloatUIntAddition()
            self.testUIntCGFloatAddition()
            /* Test - (CGFloat Subtraction Functions) */
            self.testCGFloatFloatSubtraction()
            self.testFloatCGFloatSubtraction()
            self.testCGFloatDoubleSubtraction()
            self.testDoubleCGFloatSubtraction()
            self.testCGFloatIntSubtraction()
            self.testIntCGFloatSubtraction()
            self.testCGFloatUIntSubtraction()
            self.testUIntCGFloatSubtraction()
            /* Test * (CGFloat Multiplication Functions) */
            self.testCGFloatFloatMultiplication()
            self.testFloatCGFloatMultiplication()
            self.testCGFloatDoubleMultiplication()
            self.testDoubleCGFloatMultiplication()
            self.testCGFloatIntMultiplication()
            self.testIntCGFloatMultiplication()
            self.testCGFloatUIntMultiplication()
            self.testUIntCGFloatMultiplication()
            /* Test / (CGFloat Division Functions) */
            self.testCGFloatFloatDivision()
            self.testFloatCGFloatDivision()
            self.testCGFloatDoubleDivision()
            self.testDoubleCGFloatDivision()
            self.testCGFloatIntDivision()
            self.testIntCGFloatDivision()
            self.testCGFloatUIntDivision()
            self.testUIntCGFloatDivision()
        }
    }
    
}
