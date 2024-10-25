//
//  FinalFrameConstraintBuilder.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 17/10/24.
//

import UIKit


class FinalFrameConstraintBuilder {
    
    var frameDescription: FrameDescription
    
    init(frameDescription: FrameDescription) {
        self.frameDescription = frameDescription
    }
    
    @discardableResult
    public func labeled(_ label: String) -> FinalFrameConstraintBuilder {
        self.frameDescription.label = label
        return self
    }
    
    var constraint: NSLayoutConstraint? {
        return frameDescription.constraint
    }
 
}
