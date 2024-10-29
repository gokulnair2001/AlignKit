//
//  FrameDescription.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//

import UIKit
    

internal class FrameDescription {
    
    var proxyView: FrameProxy
    var layoutAttribute: FrameLayoutAttribute = .none
    var relativeConstraintType: RelativeConstraintType?
    var relativeAnchors: [RelativeFrameLayoutAnchor] = []
    var sourceLocation: (file: String, line: UInt)? = nil
    var constant: ConstraintConstantValue = 0.0
    var multiplier: ConstraintMultiplierValue = 1
    var priority: ConstraintPriorityValue = 1000.0
    var label: String?
    
    /// Constraint Builder Modifier Properties
    var modificationConfig: ConstraintModificationConfig = ConstraintModificationConfig()
    
    @MainActor
    var constraint: NSLayoutConstraint? {
        return FrameConstraintBuilder.generateConstraints(frameDescription: self).first
    }
    
    init(proxyView: FrameProxy, layoutAttribute: FrameLayoutAttribute) {
        self.proxyView = proxyView
        self.layoutAttribute = layoutAttribute
    }
}
