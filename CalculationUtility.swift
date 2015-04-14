//
//  CalculationUtility.swift
//  CalculationUtility
//
//  Created by Rahul Nadella on 4/14/15.
//  Copyright (c) 2015 Rahul Nadella. All rights reserved.
//

import Foundation

protocol NumericType
{
    func +(lhs: Self, rhs: Self) -> Self
    func -(lhs: Self, rhs: Self) -> Self
    func *(lhs: Self, rhs: Self) -> Self
    func /(lhs: Self, rhs: Self) -> Self
    func %(lhs: Self, rhs: Self) -> Self
    init(_ v: Int)
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

func +(lhs: Int, rhs: Double) -> Double {
    return Double(lhs) + rhs
}

func squared<T : NumericType>(number: T) -> T
{
    /* Uses * Operator */
    return number * number
}