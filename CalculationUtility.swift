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
    Add `lhs` and `rhs`, returning a result and trapping in case of
    arithmetic overflow.
    */
    func +(lhs: Self, rhs: Self) -> Self
    /*
    Subtract `lhs` and `rhs`, returning a result and trapping in case of
    arithmetic overflow.
    */
    func -(lhs: Self, rhs: Self) -> Self
    /*
    Multiply `lhs` and `rhs`, returning a result and trapping in case of
    arithmetic overflow.
    */
    func *(lhs: Self, rhs: Self) -> Self
    /*
    Divide `lhs` and `rhs`, returning a result and trapping in case of
    arithmetic overflow.
    */
    func /(lhs: Self, rhs: Self) -> Self
    /*
    Divide `lhs` and `rhs`, returning the remainder and trapping in case of
    arithmetic overflow.
    */
    func %(lhs: Self, rhs: Self) -> Self
    /* 
    Initializer for NumericType that currently takes not arguments
    */
    init()
}
/*
All of the numeric types already implement these, but at this point the compiler 
doesn’t know that they conform to the new NumericType protocol. This done through
an Extension (in Swift also known as a Category in Objective-C).
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

/* The SUMMATION Prefix (similiar to ++) */
prefix operator ∑ {}
/*
The prefix of the sum function using an Array.

:param T
        The Array of specific NumericType (for instance, Double, Float, Int, etc.)
*/
prefix func ∑<T: NumericType>(input: [T]) -> T
{
    return sumOf(input)
}

/*
The prefix of the sum function using a specific section of MutableCollectionType

:param T
        The MutableCollectionType (Array, etc.) of specific NumericType 
        (for instance, Double, Float, Int, etc.)
*/
prefix func ∑<T: NumericType>(input : Slice<T>) -> T
{
    return sumOf(input)
}

/*
The sumOf function using variable arguments of specific NumericType (Double, Float, Int, etc.).

:param T
        The variable arguments of specific NumericType (for instance, Double, Float, Int, etc.)
*/
func sumOf<T: NumericType>(input : T...) -> T
{
    return sumOf(input)
}

/*
The sumOf function using MutableCollectionType (for instance, Array, Set, etc.) of specific 
NumericType (Double, Float, Int, etc.).

:param T
        The MutableCollectionType of specific NumericType (for instance, Double, Float, Int, etc.)
*/
func sumOf<T: NumericType>(input : Slice<T>) -> T
{
    return sumOf([] + input)
}

/*
The sumOf function of the array of specific NumericType (Double, Float, Int, etc.).

:param T
        The Array of specific NumericType (for instance, Double, Float, Int, etc.)
*/
func sumOf<T: NumericType>(input : [T]) -> T
{
    return reduce(input, T()) {$0 + $1}
}

/*
The + function overloaded to take the parameters of Int,Double and return
an explicit conversion of a Double.

:param lhs
        The Integer value
:param rhs
        The Double value
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
*/
func +(lhs: Double, rhs: Int) -> Double {
    return lhs + Double(rhs)
}

/*
The squared function returns a NumericType²

:param T
        The specific NumberType (Double, Float, Int, etc.)
*/
func squared<T : NumericType>(number: T) -> T
{
    /* Uses * Operator */
    return number * number
}