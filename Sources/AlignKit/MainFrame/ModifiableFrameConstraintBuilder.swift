//
//  ModifiableFrameConstraintBuilder.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//


import UIKit


class ModifiableFrameConstraintBuilder: PriorityFrameConstraintBuilder {
    
    @discardableResult
    func inset(_ constant: CGFloat) -> ModifiableFrameConstraintBuilder {
        self.frameDescription.constant = constant
        return self
    }
    
    @discardableResult
    func offset(_ constant: CGFloat) -> ModifiableFrameConstraintBuilder {
        self.frameDescription.constant = -constant
        return self
    }
   
    @discardableResult
    func multiplier(_ constant: CGFloat) -> ModifiableFrameConstraintBuilder {
        self.frameDescription.multiplier = constant
        return self
    }
    
    @discardableResult
    func divider(_ constant: CGFloat) -> ModifiableFrameConstraintBuilder {
        self.frameDescription.multiplier = 1/constant
        return self
    }
    
}
