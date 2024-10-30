//
//  FrameDescription.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//

import UIKit
    

/// `FrameDescription` encapsulates the properties and configuration needed to create and manage layout constraints for a `FrameProxy`.
///
/// This class serves as a descriptor for layout attributes, relative anchors, and configuration settings that influence how constraints
/// are constructed and modified. It includes metadata for debugging and context about the source of the constraints.
internal class FrameDescription {
    
    /// The proxy view associated with this frame description, where constraints will be applied.
    var proxyView: FrameProxy
    
    /// The layout attribute representing the type of layout attributes used for constraints.
    var layoutAttribute: FrameLayoutAttribute = .none
    
    /// The type of relative constraint to be applied, if any.
    var relativeConstraintType: RelativeConstraintType = .equalTo
    
    /// An array of relative anchors that provide context for the layout.
    var relativeAnchors: [RelativeFrameLayoutAnchor] = []
    
    /// The source location (file and line number) for debugging purposes.
    var sourceLocation: (file: String, line: UInt)? = nil
    
    /// The constant value associated with the constraint, defaulting to 0.0.
    var constant: ConstraintConstantValue = 0.0
    
    /// The multiplier value associated with the constraint, defaulting to 1.
    var multiplier: ConstraintMultiplierValue = 1
    
    /// The priority of the constraint, defaulting to 1000.0.
    var priority: ConstraintPriorityValue = 1000.0
    
    /// An optional label for identifying the constraint in debugging or logging.
    var label: String?
    
    /// Configuration for modifying the constraint builder operation.
    var modificationConfig: ConstraintModificationConfig = ConstraintModificationConfig()
    
    /// A computed property that generates the first NSLayoutConstraint based on the current frame description.
    ///
    /// - Returns: An optional NSLayoutConstraint generated from the frame description.
    @MainActor
    var constraint: NSLayoutConstraint? {
        return FrameConstraintBuilder.generateConstraints(frameDescription: self).first
    }
    
    /// Initialises a new `FrameDescription` with the specified proxy view and layout attribute.
    ///
    /// - Parameters:
    ///   - proxyView: The `FrameProxy` instance associated with this description.
    ///   - layoutAttribute: The `FrameLayoutAttribute` indicating the types of layout attributes used for constraints
    init(proxyView: FrameProxy, layoutAttribute: FrameLayoutAttribute) {
        self.proxyView = proxyView
        self.layoutAttribute = layoutAttribute
    }
}
