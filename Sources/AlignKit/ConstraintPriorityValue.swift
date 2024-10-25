//
//  ConstraintPriorityValue.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//

import UIKit


public protocol ConstraintPriorityValue {
    
    var constraintPriorityValue: Float { get }
    
}

extension Int: ConstraintPriorityValue {
    
    public var constraintPriorityValue: Float {
        return Float(self)
    }
    
}

extension UInt: ConstraintPriorityValue {
    
    public var constraintPriorityValue: Float {
        return Float(self)
    }
    
}

extension Float: ConstraintPriorityValue {
    
    public var constraintPriorityValue: Float {
        return self
    }
    
}

extension Double: ConstraintPriorityValue {
    
    public var constraintPriorityValue: Float {
        return Float(self)
    }
    
}

extension CGFloat: ConstraintPriorityValue {
    
    public var constraintPriorityValue: Float {
        return Float(self)
    }
    
}
