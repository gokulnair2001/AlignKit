//
//  PriorityFrameConstraintBuilder.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 17/10/24.
//

import UIKit


/// `PriorityFrameConstraintBuilder` is a class that allows setting the priority for layout constraints.
/// This class extends `FinalFrameConstraintBuilder` to facilitate the adjustment of constraint priorities.
public class PriorityFrameConstraintBuilder: FinalFrameConstraintBuilder {
    
    /// Sets the priority of the constraint using a `ConstraintPriorityValue`.
    /// - Parameter value: The `ConstraintPriorityValue` to set as the constraint's priority.
    /// - Returns: An instance of `FinalFrameConstraintBuilder` for chaining.
    @discardableResult
    public func priority(_ value: ConstraintPriorityValue) -> FinalFrameConstraintBuilder {
        self.frameDescription.priority = value.constraintPriorityValue
        return self
    }
    
    /// Sets the priority of the constraint using a `ConstraintPriorityType`.
    /// - Parameter value: The `ConstraintPriorityType` to set as the constraint's priority.
    /// - Returns: An instance of `FinalFrameConstraintBuilder` for chaining.
    @discardableResult
    public func priority(_ value: ConstraintPriorityType) -> FinalFrameConstraintBuilder {
        self.frameDescription.priority = value.value
        return self
    }
}
