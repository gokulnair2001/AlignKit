//
//  Array+Extensions.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 08/11/24.
//

import UIKit


//extension Array where Element: NSLayoutConstraint {
//    /// Removes duplicate constraints of the same type (e.g., height or width) with different constant values.
//    /// Keeps only the most recently added constraint of each type.
//    @MainActor
//    func removeDuplicateConstraints() -> [NSLayoutConstraint] {
//        // Dictionary to hold the latest constraint for each attribute (e.g., height, width)
//        var latestConstraints: [NSLayoutConstraint.Attribute: NSLayoutConstraint] = [:]
//        
//        // Loop through each constraint in the array
//        for constraint in self {
//            let attribute = constraint.firstAttribute
//            
//            // Check if there's already a constraint with this attribute
//            if let existingConstraint = latestConstraints[attribute] {
//                // If constants differ, keep the newer constraint and deactivate the older one
//                if existingConstraint.constant != constraint.constant {
//                    existingConstraint.isActive = false
//                    latestConstraints[attribute] = constraint
//                    
//                    debugPrint("Duplicate Constraint found: \(existingConstraint), the following constraint is removed by AlignKit".highlightForDebug(.warning))
//                }
//            } else {
//                // If no constraint with this attribute exists, add it to the dictionary
//                latestConstraints[attribute] = constraint
//            }
//        }
//        
//        return latestConstraints.compactMap({ $0.value })
//    }
//}


extension Array where Element: NSLayoutConstraint {
    
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

