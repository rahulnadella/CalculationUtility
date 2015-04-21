/*
The MIT License (MIT)

Copyright (c) 2015 Rahul Nadella http://github.com/rahulnadella

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

import CoreGraphics
import Foundation

/*
The NumericType protocol has the common requirements for types that support
arithmetic operators that take numerical values (either literals or variables) 
as their operands and return a single numerical value. The standard arithmetic 
operators are addition (+), subtraction (-), multiplication (*), and division (/).

:version 1.0
*/
protocol NumericType
{
    /*
    Add `lhs` and `rhs`, returns a result and trapping in case of
    arithmetic overflow.
    */
    func +(lhs: Self, rhs: Self) -> Self
    /*
    Subtract `lhs` and `rhs`, returns a result and trapping in case of
    arithmetic overflow.
    */
    func -(lhs: Self, rhs: Self) -> Self
    /*
    Multiply `lhs` and `rhs`, returns a result and trapping in case of
    arithmetic overflow.
    */
    func *(lhs: Self, rhs: Self) -> Self
    /*
    Divide `lhs` and `rhs`, returns a result and trapping in case of
    arithmetic overflow.
    */
    func /(lhs: Self, rhs: Self) -> Self
    /*
    Divide `lhs` and `rhs`, returns the remainder and trapping in case of
    arithmetic overflow.
    */
    func %(lhs: Self, rhs: Self) -> Self
    /*
    `lhs` is less than 'rhs' returns true otherwise false
    */
    func <(lhs: Self, rhs: Self) -> Bool
    /*
    `lhs` is greater than 'rhs' returns true otherwise false
    */
    func >(lhs: Self, rhs: Self) -> Bool
    /* 
    Initializer for NumericType that currently takes not arguments
    */
    init()
}
/*
All of the numeric types already implement these, but at this point the compiler
doesn’t know that they conform to the new NumericType protocol. This done through
an Extension (in Swift also known as a Category in Objective-C). 

Apple calls this “declaring protocol adoption with an extension.”
*/
extension Double : NumericType {}
extension Float  : NumericType {}
extension Int    : NumericType {}
extension Int8   : NumericType {}
extension Int16  : NumericType {}
extension Int32  : NumericType {}
extension Int64  : NumericType {}
extension UInt   : NumericType {}
extension UInt8  : NumericType {}
extension UInt16 : NumericType {}
extension UInt32 : NumericType {}
extension UInt64 : NumericType {}

//MARK: ###########################Summation Functions###########################

/* The SUMMATION Prefix (similiar to ++counter) */
prefix operator ∑ {}

/*
The prefix of the sum function using an Array.

:param T
        The Array of specific NumericType (using the NumericType protocol as a 
        generic constraint, and call it with any numeric type we like for instance, 
        Double, Float, Int, etc.)
*/
prefix func ∑<T: NumericType>(input: [T]) -> T
{
    return sumOf(input)
}

/*
The prefix of the sum function using a specific section of MutableCollectionType

:param T
        The MutableCollectionType (Array, etc.) of specific NumericType 
        (using the NumericType protocol as a generic constraint, and call 
        it with any numeric type we like for instance, Double, Float, Int, etc.)
*/
prefix func ∑<T: NumericType>(input : Slice<T>) -> T
{
    return sumOf(input)
}

/*
The sumOf function using variable arguments of specific NumericType (Double, Float, Int, etc.).

:param T
        The variable arguments of specific NumericType (using the NumericType protocol as a
        generic constraint, and call it with any numeric type we like for instance,
        Double, Float, Int, etc.)
*/
func sumOf<T: NumericType>(input : T...) -> T
{
    return sumOf(input)
}

/*
The sumOf function using MutableCollectionType (for instance, Array, Set, etc.) of specific 
NumericType (Double, Float, Int, etc.).

:param T
        The MutableCollectionType of specific NumericType (using the NumericType protocol as a
        generic constraint, and call it with any numeric type we like for instance,
        Double, Float, Int, etc.))
*/
func sumOf<T: NumericType>(input : Slice<T>) -> T
{
    return sumOf([] + input)
}

/*
The sumOf function of the array of specific NumericType (Double, Float, Int, etc.).

:param T
        The Array of specific NumericType (using the NumericType protocol as a
        generic constraint, and call it with any numeric type we like for instance,
        Double, Float, Int, etc.)
*/
func sumOf<T: NumericType>(input : [T]) -> T
{
    return reduce(input, T()) {$0 + $1}
}

//MARK: ################################Factorial################################

/* The FACTORIAL Postfix (similiar to counter++) */
postfix operator ~! {}

/*
The prefix of the factorial function using an IntegerType.

:param T
        The specific Integer (greater than 0) value used to calculate the factorial value
:return The factorial of a positive Integer greater than 1
*/
postfix public func ~! <T: IntegerType>(var num: T) -> T
{
    assert(num > 0, "Factorial function can not receive a number less than 1")
    var result: T = 1
    while (num > 1)
    {
        result = result * num
        num--
    }
    return result
}

//MARK: ###########################Multiplication Functions###########################

/* The MULTIPLY Prefix (similiar to ++counter) */
prefix operator ∏ {}

/*
The prefix of the multiply function using an Array.

:param T
        The Array of specific NumericType (using the NumericType protocol as a
        generic constraint, and call it with any numeric type we like for instance,
        Double, Float, Int, etc.)
*/
prefix func ∏<T: NumericType>(input: [T]) -> T
{
    return productOf(input)
}

/*
The prefix of the multiply function using a specific section of MutableCollectionType

:param T
        The MutableCollectionType (Array, etc.) of specific NumericType
        (using the NumericType protocol as a generic constraint, and call
        it with any numeric type we like for instance, Double, Float, Int, etc.)
*/
prefix func ∏<T: NumericType>(input : Slice<T>) -> T
{
    return productOf(input)
}

/*
The productOf function using variable arguments of specific NumericType (Double, Float, Int, etc.).

:param T
        The variable arguments of specific NumericType (using the NumericType protocol as a
        generic constraint, and call it with any numeric type we like for instance,
        Double, Float, Int, etc.)
*/
func productOf<T: NumericType>(input : T...) -> T
{
    return productOf(input)
}

/*
The productOf function using MutableCollectionType (for instance, Array, Set, etc.) of specific
NumericType (Double, Float, Int, etc.).

:param T
        The MutableCollectionType of specific NumericType (using the NumericType protocol as a
        generic constraint, and call it with any numeric type we like for instance,
        Double, Float, Int, etc.))
*/
func productOf<T: NumericType>(input : Slice<T>) -> T
{
    return productOf([] + input)
}

/*
The productOf function of the array of specific NumericType (Double, Float, Int, etc.).

:param T
        The Array of specific NumericType (using the NumericType protocol as a
        generic constraint, and call it with any numeric type we like for instance,
        Double, Float, Int, etc.)
*/
func productOf<T: NumericType>(var input : [T]) -> T
{
    return input.count == 0 ? T() : reduce(input[1..<input.count], input[0]) {$0 * $1}
}

//MARK: ###########Additional Functions for Calculated Numerical Values###########

/*
The squared function returns a NumericType² (n² = n x n)

:param T
        The specific NumberType (using the NumericType protocol as a
        generic constraint, and call it with any numeric type we like for instance,
        Double, Float, Int, etc.)
*/
func squared<T : NumericType>(number: T) -> T
{
    /* Uses * Operator */
    return number * number
}

/*
The cubic function returns a NumericType³ (n³ = n × n × n).

:param T
        The specific NumberType (using the NumericType protocol as a
        generic constraint, and call it with any numeric type we like for instance,
        Double, Float, Int, etc.)
*/
func cubed<T : NumericType>(number : T) -> T
{
    return number * number * number
}

/*
The min function returns the minimum value within the Collection

:param T
        The Collection consisting of specific values
*/
func min<T : Comparable> (input : [T]) -> T
{
    return reduce(input, input[0]) {$0 > $1 ? $1 : $0}
}

/*
The max function returns the maximum value within the Collection

:param T
        The Collection consisting of specific values
*/
func max<T : Comparable> (input : [T]) -> T
{
    return reduce(input, input[0]) {$0 < $1 ? $1 : $0}
}

//MARK: ####################Explicit Addition (+) Cast Functions####################

/*
The + function overloaded to take the parameters of Int,Double and return
an explicit conversion of a Double.

:param lhs
        The Integer value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func +(lhs: Int, rhs: Double) -> Double
{
    return Double(lhs) + rhs
}

/*
The + function overloaded to take the parameters of Double,Int and return 
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The Integer value
:return An explicitly cast Double value
*/
func +(lhs: Double, rhs: Int) -> Double
{
    return lhs + Double(rhs)
}

/*
The + function overloaded to take the parameters of Int,Float and return
an explicit conversion of a Float.

:param lhs
        The Integer value
:param rhs
        The Float value
:return An explicitly cast Float value
*/
func +(lhs: Int, rhs: Float) -> Float
{
    return Float(lhs) + rhs
}

/*
The + function overloaded to take the parameters of Float,Int and return
an explicit conversion of a Float.

:param lhs
        The Float value
:param rhs
        The Integer value
:return An explicitly cast Float value
*/
func +(lhs: Float, rhs: Int) -> Float
{
    return lhs + Float(rhs)
}

/*
The + function overloaded to take the parameters of Float,Double and return
an explicit conversion of a Double.

:param lhs
        The Float value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func +(lhs: Float, rhs: Double) -> Double
{
    return Double(lhs) + rhs
}

/*
The + function overloaded to take the parameters of Double,Float and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The Float value
:return An explicitly cast Double value
*/
func +(lhs: Double, rhs: Float) -> Double
{
    return lhs + Double(rhs)
}

/*
The + function overloaded to take the parameters of UInt,Double and return
an explicit conversion of a Double.

:param lhs
        The UInt value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func +(lhs: UInt, rhs: Double) -> Double
{
    return Double(lhs) + rhs
}

/*
The + function overloaded to take the parameters of Double,UInt and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The UInt value
:return An explicitly cast Double value
*/
func +(lhs: Double, rhs: UInt) -> Double
{
    return lhs + Double(rhs)
}

/*
The + function overloaded to take the parameters of UInt,Float and return
an explicit conversion of a Float.

:param lhs
        The UInt value
:param rhs
        The Float value
:return An explicitly cast Float value
*/
func +(lhs: UInt, rhs: Float) -> Float
{
    return Float(lhs) + rhs
}

/*
The + function overloaded to take the parameters of Float,UInt and return
an explicit conversion of a Float.

:param lhs
        The Float value
:param rhs
        The UInt value
:return An explicitly cast Float value
*/
func +(lhs: Float, rhs: UInt) -> Float
{
    return lhs + Float(rhs)
}

//MARK: ####################Explicit Subtraction (-) Cast Functions####################

/*
The - function overloaded to take the parameters of Int,Double and return
an explicit conversion of a Double.

:param lhs
        The Integer value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func -(lhs: Int, rhs: Double) -> Double
{
    return Double(lhs) - rhs
}

/*
The - function overloaded to take the parameters of Double,Int and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The Integer value
:return An explicitly cast Double value
*/
func -(lhs: Double, rhs: Int) -> Double
{
    return lhs - Double(rhs)
}

/*
The - function overloaded to take the parameters of Int,Float and return
an explicit conversion of a Float.

:param lhs
        The Int value
:param rhs
        The Float value
:return An explicitly cast Float value
*/
func -(lhs: Int, rhs: Float) -> Float
{
    return Float(lhs) - rhs
}

/*
The - function overloaded to take the parameters of Float,Int and return
an explicit conversion of a Float.

:param lhs
        The Float value
:param rhs
        The Int value
:return An explicitly cast Float value
*/
func -(lhs: Float, rhs: Int) -> Float
{
    return lhs - Float(rhs)
}

/*
The - function overloaded to take the parameters of Float,Double and return
an explicit conversion of a Double.

:param lhs
        The Float value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func -(lhs: Float, rhs: Double) -> Double
{
    return Double(lhs) - rhs
}

/*
The - function overloaded to take the parameters of Double,Float and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The Float value
:return An explicitly cast Double value
*/
func -(lhs: Double, rhs: Float) -> Double
{
    return lhs - Double(rhs)
}

/*
The - function overloaded to take the parameters of UInt,Double and return
an explicit conversion of a Double.

:param lhs
        The UInt value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func -(lhs: UInt, rhs: Double) -> Double
{
    return Double(lhs) - rhs
}

/*
The - function overloaded to take the parameters of Double,UInt and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The UInt value
:return An explicitly cast Double value
*/
func -(lhs: Double, rhs: UInt) -> Double
{
    return lhs - Double(rhs)
}

/*
The - function overloaded to take the parameters of UInt,Float and return
an explicit conversion of a Float.

:param lhs
        The UInt value
:param rhs
        The Float value
:return An explicitly cast Float value
*/
func -(lhs: UInt, rhs: Float) -> Float
{
    return Float(lhs) - rhs
}

/*
The - function overloaded to take the parameters of Float,UInt and return
an explicit conversion of a Float.

:param lhs
        The Float value
:param rhs
        The UInt value
:return An explicitly cast Float value
*/
func -(lhs: Float, rhs: UInt) -> Float
{
    return lhs - Float(rhs)
}

//MARK: ####################Explicit Multiplication (*) Cast Functions####################

/*
The * function overloaded to take the parameters of Int,Double and return
an explicit conversion of a Double.

:param lhs
        The Int value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func *(lhs: Int, rhs: Double) -> Double
{
    return Double(lhs) * rhs
}

/*
The * function overloaded to take the parameters of Double,Int and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The Int value
:return An explicitly cast Double value
*/
func *(lhs: Double, rhs: Int) -> Double
{
    return lhs * Double(rhs)
}

/*
The * function overloaded to take the parameters of Int,Float and return
an explicit conversion of a Float.

:param lhs
        The Int value
:param rhs
        The Float value
:return An explicitly cast Float value
*/
func *(lhs: Int, rhs: Float) -> Float
{
    return Float(lhs) * rhs
}

/*
The * function overloaded to take the parameters of Float,Int and return
an explicit conversion of a Float.

:param lhs
        The Float value
:param rhs
        The Int value
:return An explicitly cast Float value
*/
func *(lhs: Float, rhs: Int) -> Float
{
    return lhs * Float(rhs)
}

/*
The * function overloaded to take the parameters of Float,Double and return
an explicit conversion of a Double.

:param lhs
        The Float value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func *(lhs: Float, rhs: Double) -> Double
{
    return Double(lhs) * rhs
}

/*
The * function overloaded to take the parameters of Double,Float and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The Float value
:return An explicitly cast Double value
*/
func *(lhs: Double, rhs: Float) -> Double
{
    return lhs * Double(rhs)
}

/*
The * function overloaded to take the parameters of UInt,Double and return
an explicit conversion of a Double.

:param lhs
        The UInt value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func *(lhs: UInt, rhs: Double) -> Double
{
    return Double(lhs) * rhs
}

/*
The * function overloaded to take the parameters of Double,UInt and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The UInt value
:return An explicitly cast Double value
*/
func *(lhs: Double, rhs: UInt) -> Double
{
    return lhs * Double(rhs)
}

/*
The * function overloaded to take the parameters of UInt,Float and return
an explicit conversion of a Float.

:param lhs
        The UInt value
:param rhs
        The Float value
:return An explicitly cast Float value
*/
func *(lhs: UInt, rhs: Float) -> Float
{
    return Float(lhs) * rhs
}

/*
The * function overloaded to take the parameters of Float,UInt and return
an explicit conversion of a Float.

:param lhs
        The Float value
:param rhs
        The UInt value
:return An explicitly cast Float value
*/
func *(lhs: Float, rhs: UInt) -> Float
{
    return lhs * Float(rhs)
}

//MARK: ####################Explicit Division (/) Cast Functions####################

/*
The / function overloaded to take the parameters of Int,Double and return
an explicit conversion of a Double.

:param lhs
        The Int value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func /(lhs: Int, rhs: Double) -> Double
{
    return Double(lhs) / rhs
}

/*
The / function overloaded to take the parameters of Double,Int and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The Int value
:return An explicitly cast Double value
*/
func /(lhs: Double, rhs: Int) -> Double
{
    return lhs / Double(rhs)
}

/*
The / function overloaded to take the parameters of Int,Float and return
an explicit conversion of a Float.

:param lhs
        The Int value
:param rhs
        The Float value
:return An explicitly cast Float value
*/
func /(lhs: Int, rhs: Float) -> Float
{
    return Float(lhs) / rhs
}

/*
The / function overloaded to take the parameters of Float,Int and return
an explicit conversion of a Float.

:param lhs
        The Float value
:param rhs
        The Int value
:return An explicitly cast Float value
*/
func /(lhs: Float, rhs: Int) -> Float
{
    return lhs / Float(rhs)
}

/*
The / function overloaded to take the parameters of Float,Double and return
an explicit conversion of a Double.

:param lhs
        The Float value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func /(lhs: Float, rhs: Double) -> Double
{
    return Double(lhs) / rhs
}

/*
The / function overloaded to take the parameters of Double,Float and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The Float value
:return An explicitly cast Double value
*/
func /(lhs: Double, rhs: Float) -> Double
{
    return lhs / Double(rhs)
}

/*
The / function overloaded to take the parameters of UInt,Double and return
an explicit conversion of a Double.

:param lhs
        The UInt value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func /(lhs: UInt, rhs: Double) -> Double
{
    return Double(lhs) / rhs
}

/*
The / function overloaded to take the parameters of Double,UInt and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The UInt value
:return An explicitly cast Double value
*/
func /(lhs: Double, rhs: UInt) -> Double
{
    return lhs / Double(rhs)
}

/*
The / function overloaded to take the parameters of UInt,Float and return
an explicit conversion of a Float.

:param lhs
        The UInt value
:param rhs
        The Float value
:return An explicitly cast Float value
*/
func /(lhs: UInt, rhs: Float) -> Float
{
    return Float(lhs) / rhs
}

/*
The / function overloaded to take the parameters of Float,UInt and return
an explicit conversion of a Float.

:param lhs
        The Float value
:param rhs
        The UInt value
:return An explicitly cast Float value
*/
func /(lhs: Float, rhs: UInt) -> Float
{
    return lhs / Float(rhs)
}

//MARK: ####################Explicit Modulus (%) Cast Functions####################

/*
The % function overloaded to take the parameters of Int,Double and return
an explicit conversion of a Double.

:param lhs
        The Int value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func %(lhs: Int, rhs: Double) -> Double
{
    return Double(lhs) % rhs
}

/*
The % function overloaded to take the parameters of Double,Int and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The Int value
:return An explicitly cast Double value
*/
func %(lhs: Double, rhs: Int) -> Double
{
    return lhs % Double(rhs)
}

/*
The % function overloaded to take the parameters of Int,Float and return
an explicit conversion of a Float.

:param lhs
        The Int value
:param rhs
        The Float value
:return An explicitly cast Float value
*/
func %(lhs: Int, rhs: Float) -> Float
{
    return Float(lhs) % rhs
}

/*
The % function overloaded to take the parameters of Float,Int and return
an explicit conversion of a Float.

:param lhs
        The Float value
:param rhs
        The Int value
:return An explicitly cast Float value
*/
func %(lhs: Float, rhs: Int) -> Float
{
    return lhs % Float(rhs)
}

/*
The % function overloaded to take the parameters of Float,Double and return
an explicit conversion of a Double.

:param lhs
        The Float value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func %(lhs: Float, rhs: Double) -> Double
{
    return Double(lhs) % rhs
}

/*
The % function overloaded to take the parameters of Double,Float and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The Float value
:return An explicitly cast Double value
*/
func %(lhs: Double, rhs: Float) -> Double
{
    return lhs % Float(rhs)
}

/*
The % function overloaded to take the parameters of UInt,Double and return
an explicit conversion of a Double.

:param lhs
        The UInt value
:param rhs
        The Double value
:return An explicitly cast Double value
*/
func %(lhs: UInt, rhs: Double) -> Double
{
    return Double(lhs) % rhs
}

/*
The % function overloaded to take the parameters of Double,UInt and return
an explicit conversion of a Double.

:param lhs
        The Double value
:param rhs
        The UInt value
:return An explicitly cast Double value
*/
func %(lhs: Double, rhs: UInt) -> Double
{
    return lhs % Double(rhs)
}

/*
The % function overloaded to take the parameters of UInt,Float and return
an explicit conversion of a Float.

:param lhs
        The UInt value
:param rhs
        The Float value
:return An explicitly cast Float value
*/
func %(lhs: UInt, rhs: Float) -> Float
{
    return Float(lhs) % rhs
}

/*
The % function overloaded to take the parameters of Float,UInt and return
an explicit conversion of a Float.

:param lhs
        The Float value
:param rhs
        The UInt value
:return An explicitly cast Float value
*/
func %(lhs: Float, rhs: UInt) -> Float
{
    return lhs % Float(rhs)
}

//MARK: ####################Explicit Less Than (<) Cast Functions####################

/*
The < function overloaded to take the parameters of Int,Double and return
a Boolean value to indicate a true (if Int is less than Double) otherwise 
false (Double greater than Int)

:param lhs
        The Int value
:param rhs
        The Double value
:return An explicit cast less than Boolean value of true (Int less than Double) otherwise false
*/
func <(lhs: Int, rhs: Double) -> Bool
{
    return Double(lhs) < rhs
}

/*
The < function overloaded to take the parameters of Double,Int and return
a Boolean value to indicate a true (if Double is less than Int) otherwise
false (Int greater than Double)

:param lhs
        The Double value
:param rhs
        The Int value
:return An explicit cast less than Boolean value of true (Double less than Int) otherwise false
*/
func <(lhs: Double, rhs: Int) -> Bool
{
    return lhs < Double(rhs)
}

/*
The < function overloaded to take the parameters of Int,Float and return
a Boolean value to indicate a true (if Int is less than Float) otherwise
false (Float greater than Int)

:param lhs
        The Int value
:param rhs
        The Float value
:return An explicit cast less than Boolean value of true (Int less than Float) otherwise false
*/
func <(lhs: Int, rhs: Float) -> Bool
{
    return Float(lhs) < rhs
}

/*
The < function overloaded to take the parameters of Float,Int and return
a Boolean value to indicate a true (if Float is less than Int) otherwise
false (Int greater than Float)

:param lhs
        The Float value
:param rhs
        The Int value
:return An explicit cast less than Boolean value of true (Float less than Int) otherwise false
*/
func <(lhs: Float, rhs: Int) -> Bool
{
    return lhs < Float(rhs)
}

/*
The < function overloaded to take the parameters of Float,Double and return
a Boolean value to indicate a true (if Float is less than Double) otherwise
false (Double greater than Float)

:param lhs
        The Float value
:param rhs
        The Double value
:return An explicit cast less than Boolean value of true (Float less than Double) otherwise false
*/
func <(lhs: Float, rhs: Double) -> Bool
{
    return Double(lhs) < rhs
}

/*
The < function overloaded to take the parameters of Double,Float and return
a Boolean value to indicate a true (if Double is less than Float) otherwise
false (Float greater than Double)

:param lhs
        The Double value
:param rhs
        The Float value
:return An explicit cast less than Boolean value of true (Double less than Float) otherwise false
*/
func <(lhs: Double, rhs: Float) -> Bool
{
    return lhs < Double(rhs)
}

/*
The < function overloaded to take the parameters of UInt,Double and return
a Boolean value to indicate a true (if UInt is less than Double) otherwise
false (Double greater than UInt)

:param lhs
        The UInt value
:param rhs
        The Double value
:return An explicit cast less than Boolean value of true (UInt less than Double) otherwise false
*/
func <(lhs: UInt, rhs: Double) -> Bool
{
    return Double(lhs) < rhs
}

/*
The < function overloaded to take the parameters of Double,UInt and return
a Boolean value to indicate a true (if Double is less than UInt) otherwise
false (UInt greater than Double)

:param lhs
        The Double value
:param rhs
        The UInt value
:return An explicit cast less than Boolean value of true (Double less than UInt) otherwise false
*/
func <(lhs: Double, rhs: UInt) -> Bool
{
    return lhs < Double(rhs)
}

/*
The < function overloaded to take the parameters of UInt,Float and return
a Boolean value to indicate a true (if UInt is less than Float) otherwise
false (Float greater than UInt)

:param lhs
        The UInt value
:param rhs
        The Float value
:return An explicit cast less than Boolean value of true (UInt less than Float) otherwise false
*/
func <(lhs: UInt, rhs:Float) -> Bool
{
    return Float(lhs) < rhs
}

/*
The < function overloaded to take the parameters of Float,UInt and return
a Boolean value to indicate a true (if Float is less than UInt) otherwise
false (UInt greater than Float)

:param lhs
        The Float value
:param rhs
        The UInt value
:return An explicit cast less than Boolean value of true (Float less than UInt) otherwise false
*/
func <(lhs: Float, rhs:UInt) -> Bool
{
    return lhs < Float(rhs)
}

//MARK: ####################Explicit Greater Than (>) Cast Functions####################

/*
The > function overloaded to take the parameters of Int,Double and return
a Boolean value to indicate a true (if Int is greater than Double) otherwise
false (Double less than Int)

:param lhs
        The Int value
:param rhs
        The Double value
:return An explicit cast greater than Boolean value of true (Int greater than Double) otherwise false
*/
func >(lhs: Int, rhs: Double) -> Bool
{
    return Double(lhs) > rhs
}

/*
The > function overloaded to take the parameters of Double,Int and return
a Boolean value to indicate a true (if Double is greater than Int) otherwise
false (Int less than Double)

:param lhs
        The Double value
:param rhs
        The Int value
:return An explicit cast greater than Boolean value of true (Double greater than Int) otherwise false
*/
func >(lhs: Double, rhs: Int) -> Bool
{
    return lhs > Double(rhs)
}

/*
The > function overloaded to take the parameters of Int,Float and return
a Boolean value to indicate a true (if Int is greater than Float) otherwise
false (Float less than Int)

:param lhs
        The Int value
:param rhs
        The Float value
:return An explicit cast greater than Boolean value of true (Int greater than Float) otherwise false
*/
func >(lhs: Int, rhs: Float) -> Bool
{
    return Float(lhs) > rhs
}

/*
The > function overloaded to take the parameters of Float,Int and return
a Boolean value to indicate a true (if Float is greater than Int) otherwise
false (Int less than Float)

:param lhs
        The Float value
:param rhs
        The Int value
:return An explicit cast greater than Boolean value of true (Float greater than Int) otherwise false
*/
func >(lhs: Float, rhs: Int) -> Bool
{
    return lhs > Float(rhs)
}

/*
The > function overloaded to take the parameters of Float,Double and return
a Boolean value to indicate a true (if Float is greater than Double) otherwise
false (Double less than Float)

:param lhs
        The Float value
:param rhs
        The Double value
:return An explicit cast greater than Boolean value of true (Float greater than Double) otherwise false
*/
func >(lhs: Float, rhs: Double) -> Bool
{
    return Double(lhs) > rhs
}

/*
The > function overloaded to take the parameters of Double,Float and return
a Boolean value to indicate a true (if Double is greater than Float) otherwise
false (Float less than Double)

:param lhs
        The Double value
:param rhs
        The Float value
:return An explicit cast greater than Boolean value of true (Double greater than Float) otherwise false
*/
func >(lhs: Double, rhs: Float) -> Bool
{
    return lhs > Double(rhs)
}

/*
The > function overloaded to take the parameters of UInt,Double and return
a Boolean value to indicate a true (if UInt is greater than Double) otherwise
false (Double less than UInt)

:param lhs
        The UInt value
:param rhs
        The Double value
:return An explicit cast greater than Boolean value of true (UInt greater than Double) otherwise false
*/
func >(lhs: UInt, rhs: Double) -> Bool
{
    return Double(lhs) > rhs
}

/*
The > function overloaded to take the parameters of Double,UInt and return
a Boolean value to indicate a true (if Double is greater than UInt) otherwise
false (UInt less than Double)

:param lhs
        The Double value
:param rhs
        The UInt value
:return An explicit cast greater than Boolean value of true (Double greater than UInt) otherwise false
*/
func >(lhs: Double, rhs: UInt) -> Bool
{
    return lhs > Double(rhs)
}

/*
The > function overloaded to take the parameters of UInt,Float and return
a Boolean value to indicate a true (if UInt is greater than Float) otherwise
false (Float less than UInt)

:param lhs
        The UInt value
:param rhs
        The Float value
:return An explicit cast greater than Boolean value of true (UInt greater than Float) otherwise false
*/
func >(lhs: UInt, rhs:Float) -> Bool
{
    return Float(lhs) > rhs
}

/*
The > function overloaded to take the parameters of Float,UInt and return
a Boolean value to indicate a true (if Float is greater than UInt) otherwise
false (UInt less than Float)

:param lhs
        The Float value
:param rhs
        The UInt value
:return An explicit cast greater than Boolean value of true (Float greater than UInt) otherwise false
*/
func >(lhs: Float, rhs:UInt) -> Bool
{
    return lhs > Float(rhs)
}

//MARK: ##################Explicit CGFloat Addition (+) Cast Functions##################

/*
The + function overloaded to take the parameters of CGFloat,Float and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Float value
:return An explicitly cast CGFloat value
*/
func +(lhs: CGFloat, rhs: Float) -> CGFloat
{
    return lhs + CGFloat(rhs)
}

/*
The + function overloaded to take the parameters of Float,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Float value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func +(lhs: Float, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) + rhs
}

/*
The + function overloaded to take the parameters of CGFloat,Double and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Double value
:return An explicitly cast CGFloat value
*/
func +(lhs: CGFloat, rhs: Double) -> CGFloat
{
    return lhs + CGFloat(rhs)
}

/*
The + function overloaded to take the parameters of Double,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Double value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func +(lhs: Double, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) + rhs
}

/*
The + function overloaded to take the parameters of CGFloat,Int and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Int value
:return An explicitly cast CGFloat value
*/
func +(lhs: CGFloat, rhs: Int) -> CGFloat
{
    return lhs + CGFloat(rhs)
}

/*
The + function overloaded to take the parameters of Int,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Int value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func +(lhs: Int, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) + rhs
}

/*
The + function overloaded to take the parameters of CGFloat,UInt and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The UInt value
:return An explicitly cast CGFloat value
*/
func +(lhs: CGFloat, rhs: UInt) -> CGFloat
{
    return lhs + CGFloat(rhs)
}

/*
The + function overloaded to take the parameters of UInt,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The UInt value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func +(lhs: UInt, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) + rhs
}

//MARK: ##################Explicit CGFloat Subtraction (-) Cast Functions##################

/*
The - function overloaded to take the parameters of CGFloat,Float and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Float value
:return An explicitly cast CGFloat value
*/
func -(lhs: CGFloat, rhs: Float) -> CGFloat
{
    return lhs - CGFloat(rhs)
}

/*
The - function overloaded to take the parameters of Float,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Float value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func -(lhs: Float, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) - rhs
}

/*
The - function overloaded to take the parameters of CGFloat,Double and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Double value
:return An explicitly cast CGFloat value
*/
func -(lhs: CGFloat, rhs: Double) -> CGFloat
{
    return lhs - CGFloat(rhs)
}

/*
The - function overloaded to take the parameters of Double,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Double value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func -(lhs: Double, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) - rhs
}

/*
The - function overloaded to take the parameters of CGFloat,Int and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Int value
:return An explicitly cast CGFloat value
*/
func -(lhs: CGFloat, rhs: Int) -> CGFloat
{
    return lhs - CGFloat(rhs)
}

/*
The - function overloaded to take the parameters of Int,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Int value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func -(lhs: Int, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) - rhs
}

/*
The - function overloaded to take the parameters of CGFloat,UInt and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The UInt value
:return An explicitly cast CGFloat value
*/
func -(lhs: CGFloat, rhs: UInt) -> CGFloat
{
    return lhs - CGFloat(rhs)
}

/*
The - function overloaded to take the parameters of UInt,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The UInt value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func -(lhs: UInt, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) - rhs
}

//MARK: ##################Explicit CGFloat Multiplication (*) Cast Functions##################

/*
The * function overloaded to take the parameters of CGFloat,Float and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Float value
:return An explicitly cast CGFloat value
*/
func *(lhs: CGFloat, rhs: Float) -> CGFloat
{
    return lhs * CGFloat(rhs)
}

/*
The * function overloaded to take the parameters of Float,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Float value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func *(lhs: Float, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) * rhs
}

/*
The * function overloaded to take the parameters of CGFloat,Double and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Double value
:return An explicitly cast CGFloat value
*/
func *(lhs: CGFloat, rhs: Double) -> CGFloat
{
    return lhs * CGFloat(rhs)
}

/*
The * function overloaded to take the parameters of Double,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Double value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func *(lhs: Double, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) * rhs
}

/*
The * function overloaded to take the parameters of CGFloat,Int and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Int value
:return An explicitly cast CGFloat value
*/
func *(lhs: CGFloat, rhs: Int) -> CGFloat
{
    return lhs * CGFloat(rhs)
}

/*
The * function overloaded to take the parameters of Int,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Int value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func *(lhs: Int, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) * rhs
}

/*
The * function overloaded to take the parameters of CGFloat,UInt and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The UInt value
:return An explicitly cast CGFloat value
*/
func *(lhs: CGFloat, rhs: UInt) -> CGFloat
{
    return lhs * CGFloat(rhs)
}

/*
The * function overloaded to take the parameters of UInt,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The UInt value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func *(lhs: UInt, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) * rhs
}

//MARK: ##################Explicit CGFloat Division (/) Cast Functions##################

/*
The / function overloaded to take the parameters of CGFloat,Float and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Float value
:return An explicitly cast CGFloat value
*/
func /(lhs: CGFloat, rhs: Float) -> CGFloat
{
    return lhs / CGFloat(rhs)
}

/*
The / function overloaded to take the parameters of Float,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Float value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func /(lhs: Float, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) / rhs
}

/*
The / function overloaded to take the parameters of CGFloat,Double and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Double value
:return An explicitly cast CGFloat value
*/
func /(lhs: CGFloat, rhs: Double) -> CGFloat
{
    return lhs / CGFloat(rhs)
}

/*
The / function overloaded to take the parameters of Double,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Double value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func /(lhs: Double, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) / rhs
}

/*
The / function overloaded to take the parameters of CGFloat,Int and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Int value
:return An explicitly cast CGFloat value
*/
func /(lhs: CGFloat, rhs: Int) -> CGFloat
{
    return lhs / CGFloat(rhs)
}

/*
The / function overloaded to take the parameters of Int,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Int value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func /(lhs: Int, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) / rhs
}

/*
The / function overloaded to take the parameters of CGFloat,UInt and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The UInt value
:return An explicitly cast CGFloat value
*/
func /(lhs: CGFloat, rhs: UInt) -> CGFloat
{
    return lhs / CGFloat(rhs)
}

/*
The / function overloaded to take the parameters of UInt,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The UInt value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func /(lhs: UInt, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) / rhs
}

//MARK: ##################Explicit CGFloat Modulus (%) Cast Functions##################

/*
The % function overloaded to take the parameters of CGFloat,Float and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Float value
:return An explicitly cast CGFloat value
*/
func %(lhs: CGFloat, rhs: Float) -> CGFloat
{
    return lhs % CGFloat(rhs)
}

/*
The % function overloaded to take the parameters of Float,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Float value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func %(lhs: Float, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) % rhs
}

/*
The % function overloaded to take the parameters of CGFloat,Double and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Double value
:return An explicitly cast CGFloat value
*/
func %(lhs: CGFloat, rhs: Double) -> CGFloat
{
    return lhs % CGFloat(rhs)
}

/*
The % function overloaded to take the parameters of Double,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Double value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func %(lhs: Double, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) % rhs
}

/*
The % function overloaded to take the parameters of CGFloat,Int and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The Int value
:return An explicitly cast CGFloat value
*/
func %(lhs: CGFloat, rhs: Int) -> CGFloat
{
    return lhs % CGFloat(rhs)
}

/*
The % function overloaded to take the parameters of Int,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The Int value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func %(lhs: Int, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) % rhs
}

/*
The % function overloaded to take the parameters of CGFloat,UInt and return
an explicit conversion of a CGFloat.

:param lhs
        The CGFloat value
:param rhs
        The UInt value
:return An explicitly cast CGFloat value
*/
func %(lhs: CGFloat, rhs: UInt) -> CGFloat
{
    return lhs % CGFloat(rhs)
}

/*
The % function overloaded to take the parameters of UInt,CGFloat and return
an explicit conversion of a CGFloat.

:param lhs
        The UInt value
:param rhs
        The CGFloat value
:return An explicitly cast CGFloat value
*/
func %(lhs: UInt, rhs: CGFloat) -> CGFloat
{
    return CGFloat(lhs) % rhs
}