//
//  RelativeFrameAnchorManager.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 15/10/24.
//


import UIKit


/// `RelativeFrameAnchorManager` is a class responsible for providing relative layout anchors
/// for a specified UIView.
///
/// - Note: This class should be used within the context of a UIView and provides an interface
///   to retrieve anchors based on the specified `FrameLayoutAttribute`.
internal class RelativeFrameAnchorManager {
    
    /// The view for which the relative anchors are managed.
    private let view: UIView
    
    /// Initializes a new instance of `RelativeFrameAnchorManager` with the specified view.
    ///
    /// - Parameter view: The UIView for which to manage relative anchors.
    init(view: UIView) {
        self.view = view
    }
    
    /// Retrieves the relative anchors for the specified layout attribute.
    ///
    /// - Parameter anchor: The `FrameLayoutAttribute` specifying which anchor to retrieve.
    /// - Returns: An array of `RelativeFrameLayoutAnchor` corresponding to the requested anchor.
    ///
    /// - Precondition: The `anchor` must be a valid `FrameLayoutAttribute`.
    /// - FatalError: Triggers if an unknown modifier is accessed.
    
    func getRelativeAnchor(_ anchor: FrameLayoutAttribute) -> [RelativeFrameLayoutAnchor] {
        switch anchor {
        case .top:
            return [view.topAnchor]
            
        case .bottom:
            return [view.bottomAnchor]
            
        case .left:
            return [view.leftAnchor]
            
        case .right:
            return [view.rightAnchor]
            
        case .leading:
            return [view.leadingAnchor]
            
        case .trailing:
            return [view.trailingAnchor]
            
        case .topMargin:
            return [view.layoutMarginsGuide.topAnchor]
            
        case .bottomMargin:
            return [view.layoutMarginsGuide.bottomAnchor]
            
        case .leftMargin:
            return [view.layoutMarginsGuide.leftAnchor]
            
        case .rightMargin:
            return [view.layoutMarginsGuide.rightAnchor]
            
        case .leadingMargin:
            return [view.layoutMarginsGuide.leadingAnchor]
            
        case .trailingMargin:
            return [view.layoutMarginsGuide.trailingAnchor]
            
        case .width:
            return [view.widthAnchor]
            
        case .height:
            return [view.heightAnchor]
            
        case .lastBaseline:
            return [view.lastBaselineAnchor]
            
        case .firstBaseline:
            return [view.firstBaselineAnchor]
            
        case .centerX:
            return [view.centerXAnchor]
            
        case .centerY:
            return [view.centerYAnchor]
            
        case .centerXWithInMargin:
            return [view.layoutMarginsGuide.centerXAnchor]
            
        case .centerYWithInMargin:
            return [view.layoutMarginsGuide.centerYAnchor]
            
        case .centre:
            return [view.centerXAnchor, view.centerYAnchor]
            
        case .edges:
            return [view.rightAnchor, view.leftAnchor, view.topAnchor, view.bottomAnchor]
            
        case .margins:
            return [view.layoutMarginsGuide.topAnchor, view.layoutMarginsGuide.bottomAnchor, view.layoutMarginsGuide.rightAnchor, view.layoutMarginsGuide.leftAnchor]
            
        case .centreWithInMargins:
            return [view.layoutMarginsGuide.centerXAnchor, view.layoutMarginsGuide.centerYAnchor]
            
        case .size:
            return [view.widthAnchor, view.heightAnchor]
            
        default:
            assertionFailure("AlignKit: Unknown modifier accessed")
            return []
        }
    }
}
