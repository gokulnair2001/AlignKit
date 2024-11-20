//
//  ConstraintPriorityValue.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//

import UIKit


/// A protocol that defines a type that can represent a constraint priority value.
///
/// Types conforming to this protocol provide a `constraintPriorityValue` property,
/// which returns the priority as a `Float`. This enables consistent handling of
/// priority values across different numeric types used in layout constraints.
public protocol ConstraintPriorityValue {
    
    /// The constraint priority value represented as a `Float`.
    var constraintPriorityValue: Float { get }
}

// MARK: - Conformance for Standard Numeric Types

extension Int: ConstraintPriorityValue {
    
    /// Returns the constraint priority value as a `Float`.
    public var constraintPriorityValue: Float {
        return Float(self)
    }
}

extension UInt: ConstraintPriorityValue {
    
    /// Returns the constraint priority value as a `Float`.
    public var constraintPriorityValue: Float {
        return Float(self)
    }
}

extension Float: ConstraintPriorityValue {
    
    /// Returns the constraint priority value as a `Float`.
    public var constraintPriorityValue: Float {
        return self
    }
}

extension Double: ConstraintPriorityValue {
    
    /// Returns the constraint priority value as a `Float`.
    public var constraintPriorityValue: Float {
        return Float(self)
    }
}

extension CGFloat: ConstraintPriorityValue {
    
    /// Returns the constraint priority value as a `Float`.
    public var constraintPriorityValue: Float {
        return Float(self)
    }
}
