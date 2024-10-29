//
//  ConstraintExtender.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 25/10/24.
//

import UIKit


extension NSLayoutConstraint {
    
    internal func activateIfNeeded(description: FrameDescription) {
        
        NSLayoutConstraint.activate([self])
        
        if description.modificationConfig.shouldDebugOnConsole {
            debugPrint("AlignKit -- \(description.modificationConfig.debugPrefix) \(self.readableFormat())")
        }
    }
    
    internal func updateIfNeeded(description: FrameDescription) {
        
        let newConstraint = self
        
        // Check the view's constraints and the superview's constraints
        let existingConstraints = description.proxyView.view.constraints + (description.proxyView.view.superview?.constraints ?? [])
        
        // Find the matching constraint
        if let existingConstraint = existingConstraints.first(where: {
            // Ensure firstAnchor matches
            ($0.firstAnchor == newConstraint.firstAnchor) &&
            // Match secondAnchor or handle nil cases (like for width/height constraints)
            ($0.secondAnchor == newConstraint.secondAnchor || $0.secondAnchor == nil || newConstraint.secondAnchor == nil) &&
            // Ensure same relation (equal, greaterThanOrEqual, lessThanOrEqual)
            ($0.relation == newConstraint.relation) &&
            // Constraint should be active to update it
            $0.isActive
        }) {
            
            existingConstraint.constant = newConstraint.constant
            
            if description.modificationConfig.shouldDebugOnConsole {
                debugPrint("AlignKit -- \(description.modificationConfig.debugPrefix) \(self.readableFormat())")
            }
            
        } else {
            
            fatalError("AlignKit: Trying to update a constraint which doesn't exist")
        }
        
    }
    
    internal func removeIfNeeded(description: FrameDescription) {
        
        let existingConstraints = description.proxyView.view.constraints
        let newConstraint = self
        
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
            
            if description.modificationConfig.shouldDebugOnConsole {
                debugPrint("AlignKit -- \(description.modificationConfig.debugPrefix) \(self.readableFormat())")
            }
            
        } else {
            fatalError("AlignKit: Trying to remove a constraint which doesn't exist for anchors: \(newConstraint.firstAnchor) and \(String(describing: newConstraint.secondAnchor))")
        }
        
    }
    
}

extension NSLayoutConstraint {
    
    internal func readableFormat() -> String {
        var description = ""

        if let firstItem = firstItem as? UIView {
            description += "\(firstItem.accessibilityIdentifier ?? "UIView") "
        }

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

        if let secondItem = secondItem as? UIView {
            description += "\(secondItem.accessibilityIdentifier ?? "UIView") "
        }

        if secondItem == nil {
            description += "\(constant)"
        } else {
            description += "+ \(constant)"
        }

        if multiplier != 1.0 {
            description += " * \(multiplier)"
        }

        if priority != .required {
            description += " @ \(priority.rawValue)"
        }

        return description
    }
}
