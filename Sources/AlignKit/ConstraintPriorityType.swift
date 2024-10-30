//
//  ConstraintPriorityType.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//


import UIKit


/// A struct that represents layout constraint priority values, allowing for
/// type-safe and expressive handling of constraint priorities in layout systems.
///
/// This struct conforms to `ExpressibleByFloatLiteral`, `Equatable`, and `Strideable`,
/// enabling intuitive creation and comparison of priority values. It also supports
/// arithmetic operations to adjust priority values easily.
public struct ConstraintPriorityType: ExpressibleByFloatLiteral, Equatable, Strideable {
    
    /// The type used for float literals.
    public typealias FloatLiteralType = Float
    
    /// The type used for stride operations.
    public typealias Stride = Float
    
    /// The underlying value representing the priority.
    public let value: Float
    
    /// Creates an instance of `ConstraintPriorityType` from a float literal.
    ///
    /// - Parameter value: A `Float` literal representing the priority value.
    public init(floatLiteral value: Float) {
        self.value = value
    }
    
    /// Creates an instance of `ConstraintPriorityType` from a `Float`.
    ///
    /// - Parameter value: A `Float` representing the priority value.
    public init(_ value: Float) {
        self.value = value
    }
    
    /// A constant representing the required priority value (1000.0).
    @MainActor public static let required = ConstraintPriorityType(1000.0)
    
    /// A constant representing the high priority value (750.0).
    @MainActor public static let high = ConstraintPriorityType(750.0)
    
    /// A constant representing the medium priority value (500.0).
    @MainActor public static let medium = ConstraintPriorityType(500.0)
    
    /// A constant representing the low priority value (250.0).
    @MainActor public static let low = ConstraintPriorityType(250.0)
    
    /// Compares two instances of `ConstraintPriorityType` for equality.
    ///
    /// - Parameters:
    ///   - lhs: The left-hand side instance.
    ///   - rhs: The right-hand side instance.
    /// - Returns: `true` if the two instances have the same priority value; otherwise, `false`.
    public static func ==(lhs: ConstraintPriorityType, rhs: ConstraintPriorityType) -> Bool {
        return lhs.value == rhs.value
    }
    
    /// Advances the priority value by a specified stride.
    ///
    /// - Parameter n: The distance to advance.
    /// - Returns: A new instance of `ConstraintPriorityType` with the advanced value.
    public func advanced(by n: Stride) -> Self {
        return ConstraintPriorityType(floatLiteral: value + n)
    }
    
    /// Calculates the distance to another `ConstraintPriorityType`.
    ///
    /// - Parameter other: The other instance to compare against.
    /// - Returns: The distance from the current instance to the other instance's value.
    public func distance(to other: ConstraintPriorityType) -> Float {
        return other.value - value
    }
}
