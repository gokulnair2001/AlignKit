//
//  PriorityFrameConstraintBuilder.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 17/10/24.
//

import UIKit


public class PriorityFrameConstraintBuilder: FinalFrameConstraintBuilder {
    
    @discardableResult
    public func priority(_ value: ConstraintPriorityValue) -> FinalFrameConstraintBuilder {
        self.frameDescription.priority = value.constraintPriorityValue
        return self
    }
    
    @discardableResult
    func priority(_ value: ConstraintPriorityType) -> FinalFrameConstraintBuilder {
        self.frameDescription.priority = value.value
        return self
    }
    
}
