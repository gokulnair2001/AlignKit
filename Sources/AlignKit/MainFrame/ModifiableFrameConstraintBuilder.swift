//
//  ModifiableFrameConstraintBuilder.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//


import UIKit


/// `ModifiableFrameConstraintBuilder` is a specialised class that allows for the modification of
/// layout constraints, including setting insets, offsets, multipliers, and dividers.
/// This class extends `PriorityFrameConstraintBuilder` to enable additional constraint adjustments.
public class ModifiableFrameConstraintBuilder: PriorityFrameConstraintBuilder {
    
    /// Sets an inset value for the constraint.
    /// - Parameter constant: The constant value to use as an inset.
    /// - Returns: The current instance of `ModifiableFrameConstraintBuilder` for chaining.
    @discardableResult
    public func inset(_ constant: InsetConstantValue) -> ModifiableFrameConstraintBuilder {
        self.frameDescription.frameModifierType = .inset
        self.frameDescription.constant = constant.value(for: frameDescription.layoutAttribute)
        return self
    }
    
    /// Sets an offset value for the constraint, applying a negative constant.
    /// - Parameter constant: The constant value to use as an offset.
    /// - Returns: The current instance of `ModifiableFrameConstraintBuilder` for chaining.
    @discardableResult
    public func offset(_ constant: OffsetConstantValue) -> ModifiableFrameConstraintBuilder {
        self.frameDescription.frameModifierType = .offset
        self.frameDescription.constant = constant.value(for: frameDescription.layoutAttribute)
        return self
    }
   
    /// Sets a multiplier for the constraint.
    /// - Parameter constant: The constant value to use as a multiplier.
    /// - Returns: The current instance of `ModifiableFrameConstraintBuilder` for chaining.
    @discardableResult
    public func multiplier(_ constant: ConstraintMultiplierValue) -> ModifiableFrameConstraintBuilder {
        self.frameDescription.frameModifierType = .multiplier
        self.frameDescription.multiplier = constant
        return self
    }
    
    /// Sets a divider for the constraint by applying the reciprocal of the constant.
    /// - Parameter constant: The constant value to use as a divider.
    /// - Returns: The current instance of `ModifiableFrameConstraintBuilder` for chaining.
    @discardableResult
    public func divider(_ constant: ConstraintMultiplierValue) -> ModifiableFrameConstraintBuilder {
        self.frameDescription.frameModifierType = .divider
        self.frameDescription.multiplier = 1/constant.constraintMultiplierValue
        return self
    }
}
