//
//  Array+Extensions.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 08/11/24.
//

import UIKit


extension Array where Element: NSLayoutConstraint {
    
    /// Removes duplicate constraints of the same type (e.g., height or width) with different constant values.
    /// Keeps only the most recently added constraint of each type.
    @MainActor
    func removeDuplicateConstraints() -> [NSLayoutConstraint] {
        // Dictionary to store constraints by a composite key for better uniqueness
        var constraintMap: [String: NSLayoutConstraint] = [:]
        
        for constraint in self {
            // Generate a unique key for each constraint
            let key = "\(constraint.firstAnchor.debugDescription)-\(constraint.secondAnchor?.debugDescription ?? "nil")-\(constraint.relation.rawValue)"
            
            if let existingConstraint = constraintMap[key] {
                // Check if constants differ; deactivate the older one
                if existingConstraint.constant != constraint.constant {
                    existingConstraint.isActive = false
                    constraintMap[key] = constraint
                    
                    // Debug logging for duplicate constraints
                    debugPrint("""
                    Duplicate Constraint Detected:
                    - Deactivated: \(existingConstraint.readableFormat())
                    - Retained: \(constraint.readableFormat())
                    """.highlightForDebug(.warning))
                }
            } else {
                // Add the constraint to the map
                constraintMap[key] = constraint
            }
        }
        
        // Return the unique constraints
        return (constraintMap.values.map { $0 })
    }
}

