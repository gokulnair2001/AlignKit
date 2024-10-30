//
//  RelativeConstraintType.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//

import Foundation


/// `RelativeConstraintType` is an enumeration that specifies the types of relational constraints
/// that can be applied in layout configurations. This enum provides options for creating
/// different types of constraints based on the desired relationship between layout elements.
internal enum RelativeConstraintType {
    
    /// Represents a constraint that requires two values to be equal.
    case equalTo
    
    /// Represents a constraint that allows one value to be less than or equal to another value.
    case lessThanOrEqualTo
    
    /// Represents a constraint that requires one value to be greater than or equal to another value.
    case greaterThanOrEqualTo
}
