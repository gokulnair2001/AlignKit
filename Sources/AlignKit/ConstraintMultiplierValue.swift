//
//  ConstraintMultiplierValue.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//

import UIKit


public protocol ConstraintMultiplierValue {
    
    var constraintMultiplierValue: CGFloat { get }
    
}

extension Int: ConstraintMultiplierValue {
    
    public var constraintMultiplierValue: CGFloat {
        return CGFloat(self)
    }
    
}

extension UInt: ConstraintMultiplierValue {
    
    public var constraintMultiplierValue: CGFloat {
        return CGFloat(self)
    }
    
}

extension Float: ConstraintMultiplierValue {
    
    public var constraintMultiplierValue: CGFloat {
        return CGFloat(self)
    }
    
}

extension Double: ConstraintMultiplierValue {
    
    public var constraintMultiplierValue: CGFloat {
        return CGFloat(self)
    }
    
}

extension CGFloat: ConstraintMultiplierValue {
    
    public var constraintMultiplierValue: CGFloat {
        return self
    }
    
}
