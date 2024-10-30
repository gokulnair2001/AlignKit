//
//  FrameLayoutAnchor.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 14/10/24.
//

import UIKit


/// `RelativeFrameLayoutAnchor` is a protocol representing layout anchors that can be used
/// in relative frame constraints. This protocol serves as a marker for different types
/// of layout anchors, allowing for flexible constraint management in the layout framework.
public protocol RelativeFrameLayoutAnchor {
    
}

/// Extension on `RelativeFrameLayoutAnchor` providing convenience methods
/// for extracting specific types of layout anchors.
extension RelativeFrameLayoutAnchor {
    
    /// Extracts the underlying `NSLayoutYAxisAnchor` if the conforming type is a `NSLayoutYAxisAnchor`.
    /// - Returns: An optional `NSLayoutYAxisAnchor` if the cast is successful; otherwise, `nil`.
    internal var extractYAxisAnchor: NSLayoutYAxisAnchor? {
        return (self as? NSLayoutYAxisAnchor)
    }
    
    /// Extracts the underlying `NSLayoutXAxisAnchor` if the conforming type is a `NSLayoutXAxisAnchor`.
    /// - Returns: An optional `NSLayoutXAxisAnchor` if the cast is successful; otherwise, `nil`.
    internal var extractXAxisAnchor: NSLayoutXAxisAnchor? {
        return (self as? NSLayoutXAxisAnchor)
    }
    
    /// Extracts the underlying `NSLayoutDimension` if the conforming type is a `NSLayoutDimension`.
    /// - Returns: An optional `NSLayoutDimension` if the cast is successful; otherwise, `nil`.
    internal var extractDimension: NSLayoutDimension? {
        return (self as? NSLayoutDimension)
    }
}

/// Extension to allow `NSLayoutXAxisAnchor` to conform to `RelativeFrameLayoutAnchor`.
extension NSLayoutXAxisAnchor: RelativeFrameLayoutAnchor {
    
}

/// Extension to allow `NSLayoutYAxisAnchor` to conform to `RelativeFrameLayoutAnchor`.
extension NSLayoutYAxisAnchor: RelativeFrameLayoutAnchor {
    
}

/// Extension to allow `NSLayoutDimension` to conform to `RelativeFrameLayoutAnchor`.
extension NSLayoutDimension: RelativeFrameLayoutAnchor {
    
}
