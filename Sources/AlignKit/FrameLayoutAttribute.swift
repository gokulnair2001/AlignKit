//
//  FrameLayoutAttribute.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//


/// `FrameLayoutAttribute` is an option set that defines various layout attributes used for constraints.
///
/// This struct utilises the `OptionSet` protocol to represent different layout attributes, allowing
/// for the combination of multiple attributes through bitwise operations. It is used to specify which
/// attributes should be applied when creating layout constraints.
internal struct FrameLayoutAttribute: OptionSet, Hashable {
    
    /// The raw value representing the combined attributes.
    let rawValue: UInt
    
    /// An empty option set representing no layout attributes.
    static let none = FrameLayoutAttribute([])
    
    // Basic layout attributes
    static let left = FrameLayoutAttribute(rawValue: 1 << 0)
    static let top = FrameLayoutAttribute(rawValue: 1 << 1)
    static let right = FrameLayoutAttribute(rawValue: 1 << 2)
    static let bottom = FrameLayoutAttribute(rawValue: 1 << 3)
    static let leading = FrameLayoutAttribute(rawValue: 1 << 4)
    static let trailing = FrameLayoutAttribute(rawValue: 1 << 5)
    
    // Dimension attributes
    static let width = FrameLayoutAttribute(rawValue: 1 << 6)
    static let height = FrameLayoutAttribute(rawValue: 1 << 7)
    
    // Baseline attributes
    static let lastBaseline = FrameLayoutAttribute(rawValue: 1 << 8)
    static let firstBaseline = FrameLayoutAttribute(rawValue: 1 << 9)
    
    // Margin attributes
    static let leftMargin = FrameLayoutAttribute(rawValue: 1 << 10)
    static let topMargin = FrameLayoutAttribute(rawValue: 1 << 11)
    static let rightMargin = FrameLayoutAttribute(rawValue: 1 << 12)
    static let bottomMargin = FrameLayoutAttribute(rawValue: 1 << 13)
    static let leadingMargin = FrameLayoutAttribute(rawValue: 1 << 14)
    static let trailingMargin = FrameLayoutAttribute(rawValue: 1 << 15)
    
    // Center attributes
    static let centerX = FrameLayoutAttribute(rawValue: 1 << 16)
    static let centerY = FrameLayoutAttribute(rawValue: 1 << 17)
    
    static let centerXWithInMargin = FrameLayoutAttribute(rawValue: 1 << 18)
    static let centerYWithInMargin = FrameLayoutAttribute(rawValue: 1 << 19)
    
    // Grouped attributes for directional edges and margins
    static let directionalEdges: FrameLayoutAttribute = [.top, .bottom, .leading, .trailing]
    static let directionalMargins: FrameLayoutAttribute = [.topMargin, .bottomMargin, .leadingMargin, .trailingMargin]
    
    // Grouped attributes for edges and margins
    static let edges: FrameLayoutAttribute = [.top, .bottom, .left, .right]
    static let margins: FrameLayoutAttribute = [.topMargin, .bottomMargin, .leftMargin, .rightMargin]
    
    // Grouped attributes for center and center within margins
    static let centre: FrameLayoutAttribute = [.centerX, .centerY]
    static let centreWithInMargins: FrameLayoutAttribute = [.centerXWithInMargin, .centerYWithInMargin]
    
    // Grouped attributes for size
    static let size: FrameLayoutAttribute = [.width, .height]
}

/// Adds two `FrameLayoutAttribute` instances using a union operation.
/// - Parameters:
///   - left: The first set of attributes.
///   - right: The second set of attributes.
/// - Returns: A new `FrameLayoutAttribute` containing the union of both sets.
internal func + (left: FrameLayoutAttribute, right: FrameLayoutAttribute) -> FrameLayoutAttribute {
    return left.union(right)
}

/// Adds the attributes from the right side to the left side using a union operation.
/// - Parameters:
///   - left: The left attribute set to which attributes will be added.
///   - right: The right attribute set to add.
internal func +=(left: inout FrameLayoutAttribute, right: FrameLayoutAttribute) {
    left.formUnion(right)
}

/// Subtracts the attributes from the right side from the left side.
/// - Parameters:
///   - left: The left attribute set from which attributes will be removed.
///   - right: The right attribute set to remove.
internal func -=(left: inout FrameLayoutAttribute, right: FrameLayoutAttribute) {
    left.subtract(right)
}

/// Compares two `FrameLayoutAttribute` instances for equality.
/// - Parameters:
///   - left: The first attribute set to compare.
///   - right: The second attribute set to compare.
/// - Returns: A Boolean value indicating whether the two sets are equal.
internal func ==(left: FrameLayoutAttribute, right: FrameLayoutAttribute) -> Bool {
    return left.rawValue == right.rawValue
}
