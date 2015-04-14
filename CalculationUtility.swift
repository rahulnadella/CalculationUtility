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

protocol NumericType
{
    func +(lhs: Self, rhs: Self) -> Self
    func -(lhs: Self, rhs: Self) -> Self
    func *(lhs: Self, rhs: Self) -> Self
    func /(lhs: Self, rhs: Self) -> Self
    func %(lhs: Self, rhs: Self) -> Self
    init()
}

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

prefix operator ∑ {}

prefix func ∑<T: NumericType>(input: [T]) -> T
{
    return sumOf(input)
}

prefix func ∑<T: NumericType>(input : Slice<T>) -> T
{
    return sumOf(input)
}

func sumOf<T: NumericType>(input : T...) -> T
{
    return sumOf(input)
}

func sumOf<T: NumericType>(input : Slice<T>) -> T
{
    return sumOf([] + input)
}

func sumOf<T: NumericType>(input : [T]) -> T
{
    return reduce(input, T()) {$0 + $1}
}

func +(lhs: Int, rhs: Double) -> Double
{
    return Double(lhs) + rhs
}

func +(lhs: Double, rhs: Int) -> Double {
    return lhs + Double(rhs)
}

func squared<T : NumericType>(number: T) -> T
{
    /* Uses * Operator */
    return number * number
}