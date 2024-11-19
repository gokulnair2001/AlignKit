//
//  FrameAnchorable.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 15/10/24.
//


import UIKit


/// A protocol that defines the requirements for types that can provide layout anchors for frame-based constraints.
///
/// The `FrameAnchorable` protocol allows conforming types to expose various layout anchors,
/// which can be used to create and manage constraints in a flexible and type-safe manner.
/// It is designed to work with any type that represents anchors, such as `NSLayoutXAxisAnchor`,
/// `NSLayoutYAxisAnchor`, and `NSLayoutDimension`.

public protocol FrameAnchorable {
    
    /// The type of anchor that this protocol will provide.
    associatedtype AnchorType
    
    /// A layout anchor representing the top edge of the frame.
    var top: AnchorType { get }
    
    /// A layout anchor representing the bottom edge of the frame.
    var bottom: AnchorType { get }
    
    /// A layout anchor representing the left edge of the frame.
    var left: AnchorType { get }
    
    /// A layout anchor representing the right edge of the frame.
    var right: AnchorType { get }
    
    /// A layout anchor representing the leading edge of the frame.
    var leading: AnchorType { get }
    
    /// A layout anchor representing the trailing edge of the frame.
    var trailing: AnchorType { get }
    
    /// A layout anchor representing the top margin of the frame.
    var topMargin: AnchorType { get }
    
    /// A layout anchor representing the bottom margin of the frame.
    var bottomMargin: AnchorType { get }
    
    /// A layout anchor representing the left margin of the frame.
    var leftMargin: AnchorType { get }
    
    /// A layout anchor representing the right margin of the frame.
    var rightMargin: AnchorType { get }
    
    /// A layout anchor representing all margins of the frame.
    var margins: AnchorType { get }
    
    /// A layout anchor representing the leading margin of the frame.
    var leadingMargin: AnchorType { get }
    
    /// A layout anchor representing the trailing margin of the frame.
    var trailingMargin: AnchorType { get }
    
    /// A layout anchor representing the width of the frame.
    var width: AnchorType { get }
    
    /// A layout anchor representing the height of the frame.
    var height: AnchorType { get }
    
    /// A layout anchor representing the last baseline of the frame.
    var lastBaseline: AnchorType { get }
    
    /// A layout anchor representing the first baseline of the frame.
    var firstBaseline: AnchorType { get }
    
    /// A layout anchor representing all edges of the frame.
    var edges: AnchorType { get }
    
    /// A layout anchor representing the center of the frame.
    var centre: AnchorType { get }
    
    /// A layout anchor representing the center of the frame within its margins.
    var centreWithInMargins: AnchorType { get }
    
    /// A layout anchor representing the size of the frame.
    var size: AnchorType { get }
    
    /// A layout anchor representing the center Y position of the frame.
    var centreY: AnchorType { get }
    
    /// A layout anchor representing the center X position of the frame.
    var centreX: AnchorType { get }
    
    /// A layout anchor representing the center X position within the margins of the frame.
    var centerXWithInMargin: AnchorType { get }
    
    /// A layout anchor representing the center Y position within the margins of the frame.
    var centerYWithInMargin: AnchorType { get }
}
