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
    
    func directionMultiplier(_ shouldNegateConstant: Bool) -> CGFloat {
        return (shouldNegateConstant ? -1.0 : 1.0)
    }
    
    func generateConstraints(relativeAnchors: [RelativeFrameLayoutAnchor]) -> [NSLayoutConstraint] {
        
        guard let superview = frameDescription.proxyView.view.superview else {
            fatalError("View does not have a superview, file:\(frameDescription.sourceLocation?.file ?? "unknown") line:\(frameDescription.sourceLocation?.line ?? 0)")
        }
        
        if  frameDescription.layoutAttribute.contains(.top) ||  frameDescription.layoutAttribute.contains(.edges) ||
             frameDescription.layoutAttribute.contains(.directionalEdges) {
            
            addYAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.topAnchor, superviewAnchor: superview.topAnchor, shouldNegateConstant: false)
        }
        
        if  frameDescription.layoutAttribute.contains(.bottom) ||  frameDescription.layoutAttribute.contains(.edges) ||
             frameDescription.layoutAttribute.contains(.directionalEdges) {
            
            addYAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.bottomAnchor, superviewAnchor: superview.bottomAnchor, shouldNegateConstant: true)
        
        }
        
        if  frameDescription.layoutAttribute.contains(.left) ||  frameDescription.layoutAttribute.contains(.edges) {
            
            addXAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.leftAnchor, superviewAnchor: superview.leftAnchor, shouldNegateConstant: false)
        }
        
        if  frameDescription.layoutAttribute.contains(.right) ||  frameDescription.layoutAttribute.contains(.edges) {

            addXAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.rightAnchor, superviewAnchor: superview.rightAnchor, shouldNegateConstant: true)
        }
        
        if  frameDescription.layoutAttribute.contains(.leading) ||
             frameDescription.layoutAttribute.contains(.directionalEdges) {

            addXAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.leadingAnchor, superviewAnchor: superview.leadingAnchor, shouldNegateConstant: false)
        }
        
        if  frameDescription.layoutAttribute.contains(.trailing) ||
             frameDescription.layoutAttribute.contains(.directionalEdges){
        
            addXAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.trailingAnchor, superviewAnchor: superview.trailingAnchor, shouldNegateConstant: true)
        }
        
        if  frameDescription.layoutAttribute.contains(.topMargin) ||
             frameDescription.layoutAttribute.contains(.directionalMargins) ||
             frameDescription.layoutAttribute.contains(.margins) {

            addYAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.topAnchor, superviewAnchor: superview.layoutMarginsGuide.topAnchor, shouldNegateConstant: false)
        }
        
        if  frameDescription.layoutAttribute.contains(.bottomMargin) ||
             frameDescription.layoutAttribute.contains(.directionalMargins) ||
             frameDescription.layoutAttribute.contains(.margins) {

            addYAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.bottomAnchor, superviewAnchor: superview.layoutMarginsGuide.bottomAnchor, shouldNegateConstant: true)
            
        }
        
        if  frameDescription.layoutAttribute.contains(.leftMargin) ||
             frameDescription.layoutAttribute.contains(.margins){

            addXAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.leftAnchor, superviewAnchor: superview.layoutMarginsGuide.leftAnchor, shouldNegateConstant: false)
            
        }
        
        if  frameDescription.layoutAttribute.contains(.rightMargin) ||
             frameDescription.layoutAttribute.contains(.margins){
            
            addXAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.rightAnchor, superviewAnchor: superview.layoutMarginsGuide.rightAnchor, shouldNegateConstant: true)
        }
        
        if  frameDescription.layoutAttribute.contains(.leadingMargin) ||
             frameDescription.layoutAttribute.contains(.directionalMargins) {
            
            addXAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.leadingAnchor, superviewAnchor: superview.layoutMarginsGuide.leadingAnchor, shouldNegateConstant: false)
        }
        
        if  frameDescription.layoutAttribute.contains(.trailingMargin) ||
             frameDescription.layoutAttribute.contains(.directionalMargins) {

            addXAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.trailingAnchor, superviewAnchor: superview.layoutMarginsGuide.trailingAnchor, shouldNegateConstant: true)
            
        }
        
      
        if  frameDescription.layoutAttribute.contains(.width) ||
             frameDescription.layoutAttribute.contains(.size) {
            
            addDimensionAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.widthAnchor)
            
        }
        
        if  frameDescription.layoutAttribute.contains(.height) ||
             frameDescription.layoutAttribute.contains(.size) {
            
            addDimensionAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.heightAnchor)
        }
        
        if  frameDescription.layoutAttribute.contains(.centerX) ||  frameDescription.layoutAttribute.contains(.centre) {

            addXAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.centerXAnchor, superviewAnchor: superview.centerXAnchor, shouldNegateConstant: false)
            
        }
        
        if  frameDescription.layoutAttribute.contains(.centerY) ||  frameDescription.layoutAttribute.contains(.centre) {
      
            addYAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.centerYAnchor, superviewAnchor: superview.centerYAnchor, shouldNegateConstant: false)
        }
        
        if  frameDescription.layoutAttribute.contains(.centerXWithInMargin) ||  frameDescription.layoutAttribute.contains(.centreWithInMargins) {
            
            addXAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.centerXAnchor, superviewAnchor: superview.layoutMarginsGuide.centerXAnchor, shouldNegateConstant: false)
        
        }
        
        if  frameDescription.layoutAttribute.contains(.centerYWithInMargin) ||  frameDescription.layoutAttribute.contains(.centreWithInMargins) {
            
            addYAxisAnchor(relativeAnchors: relativeAnchors, proxyAnchor: frameDescription.proxyView.view.centerYAnchor, superviewAnchor: superview.layoutMarginsGuide.centerYAnchor, shouldNegateConstant: false)
        }
        
        return frameDescription.proxyView.constraints

    }
   
    
}
