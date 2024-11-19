//
//  GreaterThanOrEqualToConstraintManager.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 17/10/24.
//

import UIKit


/// `GreaterThanOrEqualToConstraintManager` constructs constraints for the `greaterThanOrEqualTo` relation between views.
///
/// This class generates constraints to position and size a view with the `greaterThanOrEqualTo` relation, ensuring the constrained view is
/// positioned or sized no less than specified values based on Y, X, or dimension anchors. Each constraint is configured with priority,
/// constants, and optionally a multiplier for dimension constraints.

final internal class GreaterThanOrEqualToConstraintManager: FrameConstraintManager {
    
    /// The frame description containing metadata, such as constant values, priority, and labels for each constraint.
    var frameDescription: FrameDescription
    
    /// Initialises a new `GreaterThanOrEqualToConstraintManager` with a frame description for setting up constraints.
    ///
    /// - Parameter frameDescription: The description of the frame, which holds configuration details for constraints.
    init(frameDescription: FrameDescription) {
        self.frameDescription = frameDescription
    }
    
    /// Adds Y-axis anchors with a `greaterThanOrEqualTo` relationship between the proxy view and superview or relative anchors.
    ///
    /// This method generates and applies constraints for Y-axis alignment based on a constant and priority, optionally negating the constant.
    ///
    /// - Parameters:
    ///   - relativeAnchors: An array of `RelativeFrameLayoutAnchor` containing Y-axis anchors for relative positioning.
    ///   - proxyAnchor: The Y-axis anchor of the view being constrained.
    ///   - superviewAnchor: The Y-axis anchor of the superview for direct alignment.
    ///   - shouldNegateConstant: A Boolean to indicate if the constant should be negated.
    func addYAxisAnchor(relativeAnchors: [RelativeFrameLayoutAnchor],
                        proxyAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                        superviewAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                        shouldNegateConstant: Bool) {
        
        let anchors = relativeAnchors.compactMap({ $0.extractYAxisAnchor })
        let constant = frameDescription.constant.value(for: frameDescription.layoutAttribute) * directionMultiplier(shouldNegateConstant)
        
        if anchors.isEmpty {
            // Direct constraints added if no relative anchors are provided
            let _constraint = proxyAnchor.constraint(greaterThanOrEqualTo: superviewAnchor, constant: constant)
            _constraint.priority = UILayoutPriority(frameDescription.priority.constraintPriorityValue)
            _constraint.identifier = frameDescription.label
            frameDescription.proxyView.addConstraints(constraint: _constraint)
        } else {
            // Constraints added for each relative anchor
            anchors.forEach({
                let _constraint = proxyAnchor.constraint(greaterThanOrEqualTo: $0, constant: constant)
                _constraint.priority = UILayoutPriority(frameDescription.priority.constraintPriorityValue)
                _constraint.identifier = frameDescription.label
                frameDescription.proxyView.addConstraints(constraint: _constraint)
            })
        }
    }
    
    /// Adds X-axis anchors with a `greaterThanOrEqualTo` relationship between the proxy view and superview or relative anchors.
    ///
    /// This method generates and applies constraints for X-axis alignment based on a constant and priority, optionally negating the constant.
    ///
    /// - Parameters:
    ///   - relativeAnchors: An array of `RelativeFrameLayoutAnchor` containing X-axis anchors for relative positioning.
    ///   - proxyAnchor: The X-axis anchor of the view being constrained.
    ///   - superviewAnchor: The X-axis anchor of the superview for direct alignment.
    ///   - shouldNegateConstant: A Boolean to indicate if the constant should be negated.
    func addXAxisAnchor(relativeAnchors: [RelativeFrameLayoutAnchor],
                        proxyAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                        superviewAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                        shouldNegateConstant: Bool) {
        
        let anchors = relativeAnchors.compactMap({ $0.extractXAxisAnchor })
        let constant = frameDescription.constant.value(for: frameDescription.layoutAttribute) * directionMultiplier(shouldNegateConstant)
        
        if anchors.isEmpty {
            // Direct constraints added if no relative anchors are provided
            let _constraint = proxyAnchor.constraint(greaterThanOrEqualTo: superviewAnchor, constant: constant)
            _constraint.priority = UILayoutPriority(frameDescription.priority.constraintPriorityValue)
            _constraint.identifier = frameDescription.label
            frameDescription.proxyView.addConstraints(constraint: _constraint)
        } else {
            // Constraints added for each relative anchor
            anchors.forEach({
                let _constraint = proxyAnchor.constraint(greaterThanOrEqualTo: $0, constant: constant)
                _constraint.priority = UILayoutPriority(frameDescription.priority.constraintPriorityValue)
                _constraint.identifier = frameDescription.label
                frameDescription.proxyView.addConstraints(constraint: _constraint)
            })
        }
    }
    
    /// Adds dimension constraints with a `greaterThanOrEqualTo` relationship between the proxy view and specified dimensions or relative anchors.
    ///
    /// This method generates and applies width or height constraints, optionally scaling by a multiplier for relative anchors.
    ///
    /// - Parameters:
    ///   - relativeAnchors: An array of `RelativeFrameLayoutAnchor` containing dimension anchors for relative sizing.
    ///   - proxyAnchor: The dimension anchor (width or height) of the view being constrained.
    func addDimensionAnchor(relativeAnchors: [RelativeFrameLayoutAnchor],
                            proxyAnchor: NSLayoutDimension) {
        
        let anchors = relativeAnchors.compactMap({ $0.extractDimension })
        let constant = frameDescription.constant.value(for: frameDescription.layoutAttribute)
        
        if anchors.isEmpty {
            // Direct constraints added if no relative anchors are provided
            let _constraint = proxyAnchor.constraint(equalToConstant: constant)
            _constraint.priority = UILayoutPriority(frameDescription.priority.constraintPriorityValue)
            _constraint.identifier = frameDescription.label
            frameDescription.proxyView.addConstraints(constraint: _constraint)
        } else {
            // Constraints added for each relative anchor with optional multiplier
            anchors.forEach({
                let _constraint = proxyAnchor.constraint(greaterThanOrEqualTo: $0, multiplier: frameDescription.multiplier.constraintMultiplierValue, constant: constant)
                _constraint.priority = UILayoutPriority(frameDescription.priority.constraintPriorityValue)
                _constraint.identifier = frameDescription.label
                frameDescription.proxyView.addConstraints(constraint: _constraint)
            })
        }
    }
}
