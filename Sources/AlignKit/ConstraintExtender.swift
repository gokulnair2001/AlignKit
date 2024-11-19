//
//  ConstraintExtender.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 25/10/24.
//

import UIKit


extension NSLayoutConstraint {
    
    /// Activates the constraint if needed and logs the operation if debugging is enabled.
    /// - Parameter description: A `FrameDescription` containing modification configurations.
    internal func activateIfNeeded(description: FrameDescription) {
        
        // Activate the constraint
        NSLayoutConstraint.activate([self])
        
        // Log to console if debugging is enabled
        if description.modificationConfig.shouldDebugOnConsole {
            debugPrint("\(description.modificationConfig.debugPrefix) \(self.readableFormat()) Activated".highlightForDebug(.info))
        }
    }
    
    /// Updates the constraint if it exists in the associated views and logs the operation if debugging is enabled.
    /// - Parameter description: A `FrameDescription` containing the proxy view and modification configurations.
    internal func updateIfNeeded(description: FrameDescription) {
        
        let newConstraint = self
        
        // Gather existing constraints from the view and its superview
        let existingConstraints = ((description.proxyView.view.constraints).removeDuplicateConstraints() + (description.proxyView.view.superview?.constraints ?? []))
        
        // Locate the existing matching constraint
        if let existingConstraint = existingConstraints.first(where: {
            // Ensure firstAnchor matches
            ($0.firstAnchor == newConstraint.firstAnchor) &&
            // Match secondAnchor or handle nil cases (like for width/height constraints)
            ($0.secondAnchor == newConstraint.secondAnchor || $0.secondAnchor == nil || newConstraint.secondAnchor == nil) &&
            // Ensure same relation (equal, greaterThanOrEqual, lessThanOrEqual)
            ($0.relation == newConstraint.relation) &&
            // Constraint should be active to update it
            ($0.isActive)
        }) {
            
            // Update the constant value of the existing constraint
            existingConstraint.constant = newConstraint.constant
            
            // Log to console if debugging is enabled
            if description.modificationConfig.shouldDebugOnConsole {
                debugPrint("\(description.modificationConfig.debugPrefix) \(self.readableFormat()) Updated".highlightForDebug(.info))
            }
    
            
        } else {
            // Fatal error if trying to update a non-existing constraint
            assertionFailure("AlignKit: Trying to update a constraint which doesn't exist")
        }
    }
    
    /// Removes the constraint if it exists in the associated views and logs the operation if debugging is enabled.
    /// - Parameter description: A `FrameDescription` containing the proxy view and modification configurations.
    internal func removeIfNeeded(description: FrameDescription) {
        
        let existingConstraints = description.proxyView.view.constraints
        let newConstraint = self
        
        // Locate the existing matching constraint
        if let existingConstraint = existingConstraints.first(where: {
            ($0.firstAnchor == newConstraint.firstAnchor) &&
            ($0.secondAnchor == newConstraint.secondAnchor) &&
            ($0.relation == newConstraint.relation) &&
            ($0.multiplier == newConstraint.multiplier) &&
            ($0.priority == newConstraint.priority) &&
            ($0.constant == newConstraint.constant) &&
            ($0.isActive)
        }) {
            // Deactivate the matching constraint
            NSLayoutConstraint.deactivate([existingConstraint])
            
            // Log to console if debugging is enabled
            if description.modificationConfig.shouldDebugOnConsole {
                debugPrint("\(description.modificationConfig.debugPrefix) \(self.readableFormat())".highlightForDebug(.info))
            }
            
        } else {
            // Fatal error if trying to remove a non-existing constraint
            fatalError("AlignKit: Trying to remove a constraint which doesn't exist for anchors: \(newConstraint.firstAnchor) and \(String(describing: newConstraint.secondAnchor))")
        }
    }
    
    /// - Parameter description: A `FrameDescription` containing the proxy view and modification configurations.
    internal func deactivateIfNeeded() {
        
        NSLayoutConstraint.deactivate([self])
        
        debugPrint("\(self.readableFormat()) Deactivated".highlightForDebug(.info))
    }
}

// MARK: - Readable Format for NSLayoutConstraint

extension NSLayoutConstraint {
    
    /// Generates a readable string format of the constraint for debugging purposes.
    /// - Returns: A `String` representation of the constraint's details.
    internal func readableFormat() -> String {
        var description = ""

        // Append the first item's accessibility identifier or default to "UIView"
        if let firstItem = firstItem as? UIView {
            description += "\(firstItem.accessibilityIdentifier ?? "UIView") "
        }

        // Append the relation of the constraint
        switch relation {
        case .equal:
            description += "== "
        case .greaterThanOrEqual:
            description += ">= "
        case .lessThanOrEqual:
            description += "<= "
        @unknown default:
            description += "?= "
        }

        // Append the second item's accessibility identifier or default to "UIView"
        if let secondItem = secondItem as? UIView {
            description += "\(secondItem.accessibilityIdentifier ?? "UIView") "
        }

        // Append the constant and multiplier details
        if secondItem == nil {
            description += "\(constant)"
        } else {
            description += "+ \(constant)"
        }

        if multiplier != 1.0 {
            description += " * \(multiplier)"
        }

        // Append the priority details if not default
        if priority != .required {
            description += " @ \(priority.rawValue)"
        }

        return description
    }
}

