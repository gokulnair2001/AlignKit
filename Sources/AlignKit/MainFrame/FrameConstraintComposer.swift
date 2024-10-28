//
//  FrameConstraintComposer.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//

import UIKit


public class FrameConstraintComposer {
    
    private let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    @MainActor @discardableResult
    public func makeConstraints(_ closure: (_ make: FrameConstraintBuilder) -> Void) -> ConstraintBuilderModifier {
        
        let maker = FrameConstraintBuilder(proxyView: FrameProxy(view: view))
        
        closure(maker)
        
        return ConstraintBuilderModifier(requestType: .Make, descriptions: maker.descriptions)
    }
    
    @MainActor @discardableResult
    public func updateConstraints(_ closure: (_ make: FrameConstraintBuilder) -> Void) -> ConstraintBuilderModifier {
        
        let maker = FrameConstraintBuilder(proxyView: FrameProxy(view: view))
        
        closure(maker)
        
        return ConstraintBuilderModifier(requestType: .Update, descriptions: maker.descriptions)
    }
    
    @MainActor @discardableResult
    public func removeConstraints(_ closure: (_ make: FrameConstraintBuilder) -> Void) -> ConstraintBuilderModifier {
        
        let maker = FrameConstraintBuilder(proxyView: FrameProxy(view: view))
        
        closure(maker)
        
        return ConstraintBuilderModifier(requestType: .Remove, descriptions: maker.descriptions)
    }
    
}
