//
//  ConstraintPriorityType.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//


import UIKit


public struct ConstraintPriorityType: ExpressibleByFloatLiteral, Equatable, Strideable {
    
    public typealias FloatLiteralType = Float
    
    public typealias Stride = Float
    
    public let value: Float
    
    public init(floatLiteral value: Float) {
        self.value = value
    }
    
    public init(_ value: Float) {
        self.value = value
    }
    
    /// ConstraintPriorityType
    @MainActor public static let required = ConstraintPriorityType(1000.0)
    @MainActor public static let high = ConstraintPriorityType(750.0)
    @MainActor public static let medium = ConstraintPriorityType(500.0)
    @MainActor public static let low = ConstraintPriorityType(250.0)
    
    
    /// Equatable Protocol conformance
    public static func ==(lhs: ConstraintPriorityType, rhs: ConstraintPriorityType) -> Bool {
        return lhs.value == rhs.value
    }
    
    /// Strideable Protocol conformance
    public func advanced(by n: Stride) -> Self {
        return ConstraintPriorityType(floatLiteral: value + n)
    }
    
    public func distance(to other: ConstraintPriorityType) -> Float {
        return other.value - value
    }
    
}
