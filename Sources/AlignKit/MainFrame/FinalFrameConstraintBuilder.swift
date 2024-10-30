//
//  FinalFrameConstraintBuilder.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 17/10/24.
//

import UIKit


/// `FinalFrameConstraintBuilder` is a class that finalises the construction of layout constraints.
/// It holds a `FrameDescription` object which contains all necessary information to create and manage constraints.
public class FinalFrameConstraintBuilder {
    
    /// The `FrameDescription` associated with this builder, containing layout attributes and constraints.
    var frameDescription: FrameDescription
    
    /// Initializes a new instance of `FinalFrameConstraintBuilder` with a given `FrameDescription`.
    /// - Parameter frameDescription: The `FrameDescription` that will be used for building constraints.
    init(frameDescription: FrameDescription) {
        self.frameDescription = frameDescription
    }
    
    /// Sets a label for the constraint, allowing for easier identification in debugging or logging.
    /// - Parameter label: The label to assign to the constraint.
    /// - Returns: An instance of `FinalFrameConstraintBuilder` for chaining.
    @discardableResult
    public func labeled(_ label: String) -> FinalFrameConstraintBuilder {
        self.frameDescription.label = label
        return self
    }
    
    /// The current NSLayoutConstraint object associated with this builder.
    /// - Returns: The `NSLayoutConstraint` if it exists, otherwise `nil`.
    @MainActor
    var constraint: NSLayoutConstraint? {
        return frameDescription.constraint
    }
}
