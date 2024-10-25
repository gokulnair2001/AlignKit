//
//  RelationalFrameConstraintBuilder.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//

import UIKit


class RelationalFrameConstraintBuilder {
    
    var frameDescription: FrameDescription
    
    init(_ frameDescription: FrameDescription) {
        self.frameDescription = frameDescription
    }

    @discardableResult
    func equalToSuperView(_ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .equalTo
        self.frameDescription.sourceLocation = (file, line)
        
        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }
    
    @discardableResult
    func relativeTo(_ anchors: [RelativeFrameLayoutAnchor], _ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .equalTo
        self.frameDescription.relativeAnchors = anchors
        self.frameDescription.sourceLocation = (file, line)

        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }
    
    @discardableResult
    func equalToConstant(_ constant: ConstraintConstantValue, _ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .equalTo
        self.frameDescription.constant = constant
        self.frameDescription.sourceLocation = (file, line)
        
        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }
    
    // MARK: - LessThanOrEqual
    
    @discardableResult
    func lessThanOrEqualToSuperView(_ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .lessThanOrEqualTo
        self.frameDescription.sourceLocation = (file, line)
       
        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }
    
    @discardableResult
    func lessThanOrEqualTo(_ anchors: [RelativeFrameLayoutAnchor], _ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .lessThanOrEqualTo
        self.frameDescription.relativeAnchors = anchors
        self.frameDescription.sourceLocation = (file, line)
    
        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }
    
    // MARK: - GreaterThanOrEqual
    
    @discardableResult
    func greaterThanOrEqualToSuperView(_ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .greaterThanOrEqualTo
        self.frameDescription.sourceLocation = (file, line)
        
        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }
    
    @discardableResult
    func greaterThanOrEqualTo(_ anchors: [RelativeFrameLayoutAnchor], _ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .greaterThanOrEqualTo
        self.frameDescription.relativeAnchors = anchors
        self.frameDescription.sourceLocation = (file, line)
        
        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }

}


