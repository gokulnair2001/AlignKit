//
//  LessThanOrEqualToConstraintManager.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 17/10/24.
//

import UIKit


class LessThanOrEqualToConstraintManager: FrameConstraintManager {
   
    var frameDescription: FrameDescription
    
    init(frameDescription: FrameDescription) {
        self.frameDescription = frameDescription
    }
    
    func addYAxisAnchor(relativeAnchors: [RelativeFrameLayoutAnchor],
                        proxyAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                        superviewAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                        shouldNegateConstant: Bool) {
        
        let anchors = relativeAnchors.compactMap({ $0.extractYAxisAnchor })
         let constant = frameDescription.constant.value(for: frameDescription.layoutAttribute) * directionMultiplier(shouldNegateConstant)
        
        if anchors.isEmpty {
            let _constraint = proxyAnchor.constraint(lessThanOrEqualTo: superviewAnchor, constant:  constant)
            _constraint.priority = UILayoutPriority(frameDescription.priority.constraintPriorityValue)
            _constraint.identifier = frameDescription.label
            frameDescription.proxyView.addConstraints(constraint: _constraint)
        } else {
            anchors.forEach({
                let _constraint = proxyAnchor.constraint(lessThanOrEqualTo: $0, constant:  constant)
                _constraint.priority = UILayoutPriority(frameDescription.priority.constraintPriorityValue)
                _constraint.identifier = frameDescription.label
                frameDescription.proxyView.addConstraints(constraint: _constraint)
            })
        }
    }
    
    func addXAxisAnchor(relativeAnchors: [RelativeFrameLayoutAnchor],
                        proxyAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                        superviewAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                        shouldNegateConstant: Bool) {
        
        let anchors = relativeAnchors.compactMap({ $0.extractXAxisAnchor })
         let constant = frameDescription.constant.value(for: frameDescription.layoutAttribute) * directionMultiplier(shouldNegateConstant)
        
        if anchors.isEmpty {
            let _constraint = proxyAnchor.constraint(lessThanOrEqualTo: superviewAnchor, constant:  constant)
            _constraint.priority = UILayoutPriority(frameDescription.priority.constraintPriorityValue)
            _constraint.identifier = frameDescription.label
            frameDescription.proxyView.addConstraints(constraint: _constraint)
        } else {
            anchors.forEach({
                let _constraint = proxyAnchor.constraint(lessThanOrEqualTo: $0, constant:  constant)
                _constraint.priority = UILayoutPriority(frameDescription.priority.constraintPriorityValue)
                _constraint.identifier = frameDescription.label
                frameDescription.proxyView.addConstraints(constraint: _constraint)
            })
        }
    }
    
    func addDimensionAnchor(relativeAnchors: [RelativeFrameLayoutAnchor],
                        proxyAnchor: NSLayoutDimension) {
        
        let anchors = relativeAnchors.compactMap({ $0.extractDimension })
        
        if anchors.isEmpty {
            let _constraint = proxyAnchor.constraint(equalToConstant:  frameDescription.constant.value(for: frameDescription.layoutAttribute))
            _constraint.priority = UILayoutPriority(frameDescription.priority.constraintPriorityValue)
            _constraint.identifier = frameDescription.label
            frameDescription.proxyView.addConstraints(constraint: _constraint)
        } else {
            anchors.forEach({
                let _constraint = proxyAnchor.constraint(lessThanOrEqualTo: $0, multiplier: frameDescription.multiplier.constraintMultiplierValue, constant:  frameDescription.constant.value(for: frameDescription.layoutAttribute))
                _constraint.priority = UILayoutPriority(frameDescription.priority.constraintPriorityValue)
                _constraint.identifier = frameDescription.label
                frameDescription.proxyView.addConstraints(constraint: _constraint)
            })
        }
    }
                            
}
