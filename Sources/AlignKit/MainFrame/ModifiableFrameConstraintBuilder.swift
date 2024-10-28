//
//  ModifiableFrameConstraintBuilder.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//


import UIKit


public class ModifiableFrameConstraintBuilder: PriorityFrameConstraintBuilder {
    
    @discardableResult
    public func inset(_ constant: CGFloat) -> ModifiableFrameConstraintBuilder {
        self.frameDescription.constant = constant
        return self
    }
    
    @discardableResult
    public func offset(_ constant: CGFloat) -> ModifiableFrameConstraintBuilder {
        self.frameDescription.constant = -constant
        return self
    }
   
    @discardableResult
    public func multiplier(_ constant: CGFloat) -> ModifiableFrameConstraintBuilder {
        self.frameDescription.multiplier = constant
        return self
    }
    
    @discardableResult
    public func divider(_ constant: CGFloat) -> ModifiableFrameConstraintBuilder {
        self.frameDescription.multiplier = 1/constant
        return self
    }
    
}
