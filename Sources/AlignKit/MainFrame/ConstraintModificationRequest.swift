//
//  FrameConstraintComposer.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//

import UIKit


enum ConstraintModificationRequest {
    case Make
    case Update
    case Remove
}

class FrameConstraintComposer {
    
    private let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    @discardableResult
    func makeConstraints(_ closure: (_ make: FrameConstraintBuilder) -> Void) -> ConstraintBuilderModifier {
        
        let maker = FrameConstraintBuilder(proxyView: FrameProxy(view: view))
        
        closure(maker)
        
        return ConstraintBuilderModifier(requestType: .Make, descriptions: maker.descriptions)
    }
    
    @discardableResult
    func updateConstraints(_ closure: (_ make: FrameConstraintBuilder) -> Void) -> ConstraintBuilderModifier {
        
        let maker = FrameConstraintBuilder(proxyView: FrameProxy(view: view))
        
        closure(maker)
        
        return ConstraintBuilderModifier(requestType: .Update, descriptions: maker.descriptions)
    }
    
    @discardableResult
    func removeConstraints(_ closure: (_ make: FrameConstraintBuilder) -> Void) -> ConstraintBuilderModifier {
        
        let maker = FrameConstraintBuilder(proxyView: FrameProxy(view: view))
        
        closure(maker)
        
        return ConstraintBuilderModifier(requestType: .Remove, descriptions: maker.descriptions)
    }
    
}
