//
//  FrameConstraintManager.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 17/10/24.
//

import UIKit


@MainActor
/// A protocol defining the management of frame constraints for a view.
///
/// This protocol is responsible for generating and adding various types of layout constraints
/// to a view, based on relative anchor information provided by the implementing class.
internal protocol FrameConstraintManager {
    
    /// The description of the current frame which includes proxy view and its details.
    var frameDescription: FrameDescription { get set }
    
    /// Generates an array of layout constraints based on the provided relative anchors.
    ///
    /// - Parameter relativeAnchors: An array of relative anchors that describe the positioning
    ///   of the view in relation to other views.
    /// - Returns: An array of NSLayoutConstraint objects generated based on the relative anchors.
    func generateConstraints(relativeAnchors: [RelativeFrameLayoutAnchor]) -> [NSLayoutConstraint]
    
    /// Adds a Y-axis anchor constraint to the view.
    ///
    /// - Parameters:
    ///   - relativeAnchors: An array of relative anchors that describe the positioning of the
    ///     view in relation to other views.
    ///   - proxyAnchor: The NSLayoutAnchor representing the Y-axis anchor of the view.
    ///   - superviewAnchor: The NSLayoutAnchor representing the Y-axis anchor of the superview.
    ///   - shouldNegateConstant: A Boolean value indicating whether to negate the constant of
    ///     the constraint.
    func addYAxisAnchor(relativeAnchors: [RelativeFrameLayoutAnchor],
                        proxyAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                        superviewAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                        shouldNegateConstant: Bool)
    
    /// Adds an X-axis anchor constraint to the view.
    ///
    /// - Parameters:
    ///   - relativeAnchors: An array of relative anchors that describe the positioning of the
    ///     view in relation to other views.
    ///   - proxyAnchor: The NSLayoutAnchor representing the X-axis anchor of the view.
    ///   - superviewAnchor: The NSLayoutAnchor representing the X-axis anchor of the superview.
    ///   - shouldNegateConstant: A Boolean value indicating whether to negate the constant of
    ///     the constraint.
    func addXAxisAnchor(relativeAnchors: [RelativeFrameLayoutAnchor],
                        proxyAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                        superviewAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                        shouldNegateConstant: Bool)
    
    /// Adds a dimension anchor constraint (width or height) to the view.
    ///
    /// - Parameters:
    ///   - relativeAnchors: An array of relative anchors that describe the positioning of the
    ///     view in relation to other views.
    ///   - proxyAnchor: The NSLayoutDimension representing the width or height anchor of the view.
    func addDimensionAnchor(relativeAnchors: [RelativeFrameLayoutAnchor],
                            proxyAnchor: NSLayoutDimension)
}


extension FrameConstraintManager {
    
    /// Returns the direction multiplier for a constant based on the negation flag.
    ///
    /// - Parameter shouldNegateConstant: A Boolean value indicating whether to negate the constant.
    /// - Returns: A CGFloat representing the multiplier (1.0 or -1.0) for the constant.
    internal func directionMultiplier(_ shouldNegateConstant: Bool) -> CGFloat {
        return (shouldNegateConstant ? -1.0 : 1.0)
    }
    
    /// Generates constraints based on the provided relative anchors and the frame description.
    ///
    /// - Parameter relativeAnchors: An array of relative anchors that describe the positioning
    ///   of the view in relation to other views.
    /// - Returns: An array of NSLayoutConstraint objects that were generated for the view.
    internal func generateConstraints(relativeAnchors: [RelativeFrameLayoutAnchor]) -> [NSLayoutConstraint] {
        
        guard let superview = frameDescription.proxyView.view.superview else {
            assertionFailure("View does not have a superview, file:\(frameDescription.sourceLocation?.file ?? "unknown") line:\(frameDescription.sourceLocation?.line ?? 0)")
            return []
        }
        
        // Anchor Mappings
        let anchorMappings: AnchorMapping = [
            /// Normal Anchors
            .top: .yAxis(proxy: frameDescription.proxyView.view.topAnchor, superview: superview.topAnchor, negate: false),
            .bottom: .yAxis(proxy: frameDescription.proxyView.view.bottomAnchor, superview: superview.bottomAnchor, negate: (frameDescription.frameModifierType == .inset)),
            .left: .xAxis(proxy: frameDescription.proxyView.view.leftAnchor, superview: superview.leftAnchor, negate: false),
            .right: .xAxis(proxy: frameDescription.proxyView.view.rightAnchor, superview: superview.rightAnchor, negate: (frameDescription.frameModifierType == .inset)),
            .leading: .xAxis(proxy: frameDescription.proxyView.view.leadingAnchor, superview: superview.leadingAnchor, negate: false),
            .trailing: .xAxis(proxy: frameDescription.proxyView.view.trailingAnchor, superview: superview.trailingAnchor, negate: (frameDescription.frameModifierType == .inset)),
            
            /// Marginal Anchors
            .topMargin: .yAxis(proxy: frameDescription.proxyView.view.topAnchor, superview: superview.layoutMarginsGuide.topAnchor, negate: false),
            .bottomMargin: .yAxis(proxy: frameDescription.proxyView.view.bottomAnchor, superview: superview.layoutMarginsGuide.bottomAnchor, negate: (frameDescription.frameModifierType == .inset)),
            .leftMargin: .xAxis(proxy: frameDescription.proxyView.view.leftAnchor, superview: superview.layoutMarginsGuide.leftAnchor, negate: false),
            .rightMargin: .xAxis(proxy: frameDescription.proxyView.view.rightAnchor, superview: superview.layoutMarginsGuide.rightAnchor, negate: (frameDescription.frameModifierType == .inset)),
            .leadingMargin: .xAxis(proxy: frameDescription.proxyView.view.leadingAnchor, superview: superview.layoutMarginsGuide.leadingAnchor, negate: false),
            .trailingMargin: .xAxis(proxy: frameDescription.proxyView.view.trailingAnchor, superview: superview.layoutMarginsGuide.trailingAnchor, negate: (frameDescription.frameModifierType == .inset)),
            
            /// Dimensional Anchors
            .width: .dimension(proxy: frameDescription.proxyView.view.widthAnchor),
            .height: .dimension(proxy: frameDescription.proxyView.view.heightAnchor),
            
            /// Axial Anchors
            .centerX: .xAxis(proxy: frameDescription.proxyView.view.centerXAnchor, superview: superview.centerXAnchor, negate: false),
            .centerY: .yAxis(proxy: frameDescription.proxyView.view.centerYAnchor, superview: superview.centerYAnchor, negate: false),
            .centerXWithInMargin: .xAxis(proxy: frameDescription.proxyView.view.centerXAnchor, superview: superview.layoutMarginsGuide.centerXAnchor, negate: false),
            .centerYWithInMargin: .yAxis(proxy: frameDescription.proxyView.view.centerYAnchor, superview: superview.layoutMarginsGuide.centerYAnchor, negate: false)
        ]
        
        // Iterate over anchor mappings to create necessary anchors
        anchorMappings.forEach({ (attribute, anchorType) in
            if frameDescription.layoutAttribute.contains(attribute) {
                createAnchor(anchorType, relativeAnchors)
            }
        })
        
        return frameDescription.proxyView.constraints
    }

    /// Creates an anchor constraint based on the provided layout anchor type.
    ///
    /// - Parameters:
    ///   - type: The type of layout anchor to create (Y-axis, X-axis, or dimension).
    ///   - relativeAnchors: An array of relative anchors that describe the positioning of the
    ///     view in relation to other views.
    private func createAnchor(_ type: LayoutAnchorType, _ relativeAnchors: [RelativeFrameLayoutAnchor]) {
        switch type {
        case let .yAxis(proxy, superviewAnchor, negate):
            addYAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: proxy, superviewAnchor: superviewAnchor, shouldNegateConstant: negate)
        case let .xAxis(proxy, superviewAnchor, negate):
            addXAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: proxy, superviewAnchor: superviewAnchor, shouldNegateConstant: negate)
        case let .dimension(proxy):
            addDimensionAnchor(relativeAnchors: relativeAnchors, proxyAnchor: proxy)
        }
    }
}
