//
//  LayoutAnchorType.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 29/10/24.
//

import UIKit


/// Enum representing different types of layout anchors used for positioning and sizing views.
///
/// The `LayoutAnchorType` enum defines anchors for the X and Y axes as well as for dimensions,
/// enabling the creation of layout constraints relative to a superview's anchor points.
enum LayoutAnchorType {
    
    /// Y-axis anchor configuration with a proxy view's anchor, a superview's anchor, and a negation param.
    ///
    /// Use this case when you need to align a view's vertical position relative to a superview.
    /// The `negate` flag allows flipping the alignment constant.
    ///
    /// - Parameters:
    ///   - proxy: The `NSLayoutYAxisAnchor` of the view to be constrained.
    ///   - superview: The `NSLayoutYAxisAnchor` of the superview to which the view will be constrained.
    ///   - negate: A Boolean value indicating whether to negate the alignment constant.
    case yAxis(proxy: NSLayoutYAxisAnchor, superview: NSLayoutYAxisAnchor, negate: Bool)
    
    /// X-axis anchor configuration with a proxy view's anchor, a superview's anchor, and a negation param.
    ///
    /// Use this case when you need to align a view's horizontal position relative to a superview.
    /// The `negate` flag allows flipping the alignment constant.
    ///
    /// - Parameters:
    ///   - proxy: The `NSLayoutXAxisAnchor` of the view to be constrained.
    ///   - superview: The `NSLayoutXAxisAnchor` of the superview to which the view will be constrained.
    ///   - negate: A Boolean value indicating whether to negate the alignment constant.
    case xAxis(proxy: NSLayoutXAxisAnchor, superview: NSLayoutXAxisAnchor, negate: Bool)
    
    /// Dimension anchor configuration for setting width or height constraints.
    ///
    /// Use this case when specifying a view’s dimension without needing a superview reference,
    /// for cases like setting a view's width or height directly.
    ///
    /// - Parameter proxy: The `NSLayoutDimension` representing the width or height anchor of the view.
    case dimension(proxy: NSLayoutDimension)
}

