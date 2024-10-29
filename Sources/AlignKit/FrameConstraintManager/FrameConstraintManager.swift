//
//  FrameConstraintManager.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 17/10/24.
//

import UIKit


@MainActor
internal protocol FrameConstraintManager {
    
    var frameDescription: FrameDescription { get set }
    
    func generateConstraints(relativeAnchors: [RelativeFrameLayoutAnchor]) -> [NSLayoutConstraint]
    
    func addYAxisAnchor(relativeAnchors: [RelativeFrameLayoutAnchor],
                        proxyAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                        superviewAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                        shouldNegateConstant: Bool)
    
    func addXAxisAnchor(relativeAnchors: [RelativeFrameLayoutAnchor],
                        proxyAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                        superviewAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                        shouldNegateConstant: Bool)
    
    func addDimensionAnchor(relativeAnchors: [RelativeFrameLayoutAnchor],
                            proxyAnchor: NSLayoutDimension)
}


extension FrameConstraintManager {
    
    internal func directionMultiplier(_ shouldNegateConstant: Bool) -> CGFloat {
        return (shouldNegateConstant ? -1.0 : 1.0)
    }
    
    internal func generateConstraints(relativeAnchors: [RelativeFrameLayoutAnchor]) -> [NSLayoutConstraint] {
        
        guard let superview = frameDescription.proxyView.view.superview else {
            fatalError("View does not have a superview, file:\(frameDescription.sourceLocation?.file ?? "unknown") line:\(frameDescription.sourceLocation?.line ?? 0)")
        }
        
        // Anchor Mappings
        let anchorMappings: AnchorMapping = [
            
            /// Normal Anchors
            .top: .yAxis(proxy: frameDescription.proxyView.view.topAnchor, superview: superview.topAnchor, negate: false),
            .bottom: .yAxis(proxy: frameDescription.proxyView.view.bottomAnchor, superview: superview.bottomAnchor, negate: true),
            .left: .xAxis(proxy: frameDescription.proxyView.view.leftAnchor, superview: superview.leftAnchor, negate: false),
            .right: .xAxis(proxy: frameDescription.proxyView.view.rightAnchor, superview: superview.rightAnchor, negate: true),
            .leading: .xAxis(proxy: frameDescription.proxyView.view.leadingAnchor, superview: superview.leadingAnchor, negate: false),
            .trailing: .xAxis(proxy: frameDescription.proxyView.view.trailingAnchor, superview: superview.trailingAnchor, negate: true),
            
            /// Marginal Anchors
            .topMargin: .yAxis(proxy: frameDescription.proxyView.view.topAnchor, superview: superview.layoutMarginsGuide.topAnchor, negate: false),
            .bottomMargin: .yAxis(proxy: frameDescription.proxyView.view.bottomAnchor, superview: superview.layoutMarginsGuide.bottomAnchor, negate: true),
            .leftMargin: .xAxis(proxy: frameDescription.proxyView.view.leftAnchor, superview: superview.layoutMarginsGuide.leftAnchor, negate: false),
            .rightMargin: .xAxis(proxy: frameDescription.proxyView.view.rightAnchor, superview: superview.layoutMarginsGuide.rightAnchor, negate: true),
            .leadingMargin: .xAxis(proxy: frameDescription.proxyView.view.leadingAnchor, superview: superview.layoutMarginsGuide.leadingAnchor, negate: false),
            .trailingMargin: .xAxis(proxy: frameDescription.proxyView.view.trailingAnchor, superview: superview.layoutMarginsGuide.trailingAnchor, negate: true),
            
            /// Dimensional Anchors
            .width: .dimension(proxy: frameDescription.proxyView.view.widthAnchor),
            .height: .dimension(proxy: frameDescription.proxyView.view.heightAnchor),
            
            /// Axial Anchors
            .centerX: .xAxis(proxy: frameDescription.proxyView.view.centerXAnchor, superview: superview.centerXAnchor, negate: false),
            .centerY: .yAxis(proxy: frameDescription.proxyView.view.centerYAnchor, superview: superview.centerYAnchor, negate: false),
            .centerXWithInMargin: .xAxis(proxy: frameDescription.proxyView.view.centerXAnchor, superview: superview.layoutMarginsGuide.centerXAnchor, negate: false),
            .centerYWithInMargin: .yAxis(proxy: frameDescription.proxyView.view.centerYAnchor, superview: superview.layoutMarginsGuide.centerYAnchor, negate: false)
        ]
        
        anchorMappings.forEach({ (attribute, anchorType) in
            if frameDescription.layoutAttribute.contains(attribute) {
                createAnchor(anchorType, relativeAnchors)
            }
        })
        
        return frameDescription.proxyView.constraints
    }

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
