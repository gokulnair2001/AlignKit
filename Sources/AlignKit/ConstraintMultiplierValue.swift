//
//  ConstraintMultiplierValue.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//

import UIKit


/// A protocol that represents a value that can be used as a constraint multiplier.
public protocol ConstraintMultiplierValue {
    
    /// A computed property that returns the multiplier value as a `CGFloat`.
    var constraintMultiplierValue: CGFloat { get }
}

// MARK: - Integer Extensions

extension Int: ConstraintMultiplierValue {
    
    /// Provides the `CGFloat` representation of the integer value.
    public var constraintMultiplierValue: CGFloat {
        return CGFloat(self)
    }
}

extension UInt: ConstraintMultiplierValue {
    
    /// Provides the `CGFloat` representation of the unsigned integer value.
    public var constraintMultiplierValue: CGFloat {
        return CGFloat(self)
    }
}

// MARK: - Floating-Point Extensions

extension Float: ConstraintMultiplierValue {
    
    /// Provides the `CGFloat` representation of the float value.
    public var constraintMultiplierValue: CGFloat {
        return CGFloat(self)
    }
}

extension Double: ConstraintMultiplierValue {
    
    /// Provides the `CGFloat` representation of the double value.
    public var constraintMultiplierValue: CGFloat {
        return CGFloat(self)
    }
}

// MARK: - CGFloat Extension

extension CGFloat: ConstraintMultiplierValue {
    
    /// Returns the `CGFloat` itself, as it is already the desired type.
    public var constraintMultiplierValue: CGFloat {
        return self
    }
}
