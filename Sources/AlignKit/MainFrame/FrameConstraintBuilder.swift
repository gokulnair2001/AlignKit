//
//  FrameConstraintBuilder.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//

import UIKit


public class FrameConstraintBuilder: FrameAnchorable {
    
    var proxyView: FrameProxy
    var descriptions: [FrameDescription] = []
    
    init(proxyView: FrameProxy) {
        self.proxyView = proxyView
    }
    
    public typealias AnchorType = FrameConstraintBuilderExtended
    
    public var top: AnchorType {
        storeAnchor(.top)
    }
    
    public var bottom: AnchorType {
        storeAnchor(.bottom)
    }
    
    public var left: AnchorType {
        storeAnchor(.left)
    }
    
    public var right: AnchorType {
        storeAnchor(.right)
    }
    
    public var leading: AnchorType {
        storeAnchor(.leading)
    }
    
    public var trailing: AnchorType {
        storeAnchor(.trailing)
    }
    
    public var topMargin: AnchorType {
        storeAnchor(.topMargin)
    }
    
    public var bottomMargin: AnchorType {
        storeAnchor(.bottomMargin)
    }
    
    public var leftMargin: AnchorType {
        storeAnchor(.leftMargin)
    }
    
    public var rightMargin: AnchorType {
        storeAnchor(.rightMargin)
    }
    
    public var margins: AnchorType {
        storeAnchor(.margins)
    }
    
    public var leadingMargin: AnchorType {
        storeAnchor(.leadingMargin)
    }
    
    public var trailingMargin: AnchorType {
        storeAnchor(.trailingMargin)
    }
    
    public var width: AnchorType {
        storeAnchor(.width)
    }
    
    public var height: AnchorType {
        storeAnchor(.height)
    }
    
    public var lastBaseline: AnchorType {
        storeAnchor(.lastBaseline)
    }
    
    public var firstBaseline: AnchorType {
        storeAnchor(.firstBaseline)
    }
    
    public var edges: AnchorType {
        storeAnchor(.edges)
    }
    
    public var centre: AnchorType {
        storeAnchor(.centre)
    }
    
    public var centreWithInMargins: AnchorType {
        storeAnchor(.centreWithInMargins)
    }
    
    public var size: AnchorType {
        storeAnchor(.size)
    }
    
    public var centreY: AnchorType {
        storeAnchor(.centerY)
    }
    
    public var centreX: AnchorType {
        storeAnchor(.centerX)
    }
    
    public var centerXWithInMargin: AnchorType {
        storeAnchor(.centerXWithInMargin)
    }
    
    public var centerYWithInMargin: AnchorType {
        storeAnchor(.centerYWithInMargin)
    }
    
    private func storeAnchor(_ anchor: FrameLayoutAttribute) -> FrameConstraintBuilderExtended {
        let description = FrameDescription(proxyView: self.proxyView, layoutAttribute: anchor)
        self.descriptions.append(description)
        return FrameConstraintBuilderExtended(description)
    }
    
    @MainActor
    static func generateConstraints(frameDescription: FrameDescription) -> [NSLayoutConstraint] {
        
        switch frameDescription.relativeConstraintType {
            
        case .equalTo:
            
            let constraintManager = EqualToConstraintManager(frameDescription: frameDescription)
            return constraintManager.generateConstraints(relativeAnchors: frameDescription.relativeAnchors)
            
        case .lessThanOrEqualTo:
            
            let constraintManager = LessThanOrEqualToConstraintManager(frameDescription: frameDescription)
            return constraintManager.generateConstraints(relativeAnchors: frameDescription.relativeAnchors)
            
        case .greaterThanOrEqualTo:
            
            let constraintManager = GreaterThanOrEqualToConstraintManager(frameDescription: frameDescription)
            return constraintManager.generateConstraints(relativeAnchors: frameDescription.relativeAnchors)
            
        case nil:
            fatalError("AlignKit: Something unexpected happened")
            break
        }
        
    }
    
    @MainActor
    static func makeConstraints(frameDescription: FrameDescription) {
        let constraints = generateConstraints(frameDescription: frameDescription)
        for constraint in constraints {
            constraint.activateIfNeeded(description: frameDescription)
        }
    }
    
    @MainActor
    static func updateConstraints(frameDescription: FrameDescription) {
        let constraints = generateConstraints(frameDescription: frameDescription)
        for constraint in constraints {
            constraint.updateIfNeeded(description: frameDescription)
        }
    }
    
    @MainActor
    static func removeConstraints(frameDescription: FrameDescription) {
        let constraints = generateConstraints(frameDescription: frameDescription)
        for constraint in constraints {
            constraint.removeIfNeeded(description: frameDescription)
        }
    }
}
