//
//  FrameConstraintBuilder.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//

import UIKit


class FrameConstraintBuilder: FrameAnchorable {
    
    var proxyView: FrameProxy
    var descriptions: [FrameDescription] = []
    
    init(proxyView: FrameProxy) {
        self.proxyView = proxyView
    }
    
    typealias AnchorType = FrameConstraintBuilderExtended
    
    var top: AnchorType {
        storeAnchor(.top)
    }
    
    var bottom: AnchorType {
        storeAnchor(.bottom)
    }
    
    var left: AnchorType {
        storeAnchor(.left)
    }
    
    var right: AnchorType {
        storeAnchor(.right)
    }
    
    var leading: AnchorType {
        storeAnchor(.leading)
    }
    
    var trailing: AnchorType {
        storeAnchor(.trailing)
    }
    
    var topMargin: AnchorType {
        storeAnchor(.topMargin)
    }
    
    var bottomMargin: AnchorType {
        storeAnchor(.bottomMargin)
    }
    
    var leftMargin: AnchorType {
        storeAnchor(.leftMargin)
    }
    
    var rightMargin: AnchorType {
        storeAnchor(.rightMargin)
    }
    
    var margins: AnchorType {
        storeAnchor(.margins)
    }
    
    var leadingMargin: AnchorType {
        storeAnchor(.leadingMargin)
    }
    
    var trailingMargin: AnchorType {
        storeAnchor(.trailingMargin)
    }
    
    var width: AnchorType {
        storeAnchor(.width)
    }
    
    var height: AnchorType {
        storeAnchor(.height)
    }
    
    var lastBaseline: AnchorType {
        storeAnchor(.lastBaseline)
    }
    
    var firstBaseline: AnchorType {
        storeAnchor(.firstBaseline)
    }
    
    var edges: AnchorType {
        storeAnchor(.edges)
    }
    
    var centre: AnchorType {
        storeAnchor(.centre)
    }
    
    var centreWithInMargins: AnchorType {
        storeAnchor(.centreWithInMargins)
    }
    
    var size: AnchorType {
        storeAnchor(.size)
    }
    
    var centreY: AnchorType {
        storeAnchor(.centerY)
    }
    
    var centreX: AnchorType {
        storeAnchor(.centerX)
    }
    
    var centerXWithInMargin: AnchorType {
        storeAnchor(.centerXWithInMargin)
    }
    
    var centerYWithInMargin: AnchorType {
        storeAnchor(.centerYWithInMargin)
    }
    
    private func storeAnchor(_ anchor: FrameLayoutAttribute) -> FrameConstraintBuilderExtended {
        let description = FrameDescription(proxyView: self.proxyView, layoutAttribute: anchor)
        self.descriptions.append(description)
        return FrameConstraintBuilderExtended(description)
    }
    
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
    
    static func makeConstraints(frameDescription: FrameDescription) {
        let constraints = generateConstraints(frameDescription: frameDescription)
        for constraint in constraints {
            constraint.activateIfNeeded(description: frameDescription)
        }
    }
    
    static func updateConstraints(frameDescription: FrameDescription) {
        let constraints = generateConstraints(frameDescription: frameDescription)
        for constraint in constraints {
            constraint.updateIfNeeded(description: frameDescription)
        }
    }
    
    static func removeConstraints(frameDescription: FrameDescription) {
        let constraints = generateConstraints(frameDescription: frameDescription)
        for constraint in constraints {
            constraint.removeIfNeeded(description: frameDescription)
        }
    }
}
