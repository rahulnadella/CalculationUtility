# CalculationUtility

##Overview

The CalculationUtility provides several functions to enable calculating values easier using explicit casting. The CalculationUtility contains summation, product, factorial, min, max, squared, cubed, and overloaded +-*/ (which are explicitly casted). This utility can make your life with Swift easier when doing calculation between different type.

#####Note
>Swift currently has a type check and requires left and right operand of the same type. When using this utility you will lose type safety when using these operators, which is opposite to Swift design. 

#####Version
>Version 1.0 -> Design and Implementation of the CalculationUtility 

#####Build
>Master -> Only works on iOS 8.0 or greater

##Usage

Add the [CalculationUtility](https://github.com/rahulnadella/CalculationUtility/blob/master/src/CalculationUtility.swift) to your project. This file can be found in [src/CalculationUtility.swift](https://github.com/rahulnadella/CalculationUtility/blob/master/src).

####Explicit Cast Functions

    var a = 5.0
    var b = 2
    a + b -> 7.0
    a - b -> 3.0
    a * b -> 10.0
    a / b -> 2.5
    a % b -> 1

####Factorial Function
    var value = 5
    value~! = 120

####Min/Max Functions
    var numericalValues = [4, 2, 5, 120, 500, 1001, 1, 1002]
    var minValue = min(numericalValues) -> 1
    var maxValue = max(numericalValues) -> 1002

####Summation Functions

    ∑([1, 2, 3]) -> 6
    sumOf(1, 2, 3) -> 6
    ∑(array) -> 6
    sumOf(array) -> 6
    sumOf(array[0...1]) -> 3

####Product Functions

    ∏([2, 3, 4]) -> 24
    productOf(2,3,4) -> 24
    ∏(array) -> 24
    productOf(array) -> 24
    productOf(array[0...1]) -> 6

####Squared and Cubed Function

    squared(3) -> 9
    cubed(3) -> 27

##License

*MIT License* --> A short, permissive software license. Basically, you can do whatever you want as long as you include the original copyright and license notice in any copy of the software/source.  There are many variations of this license in use.
