//
//  FrameConstraintComposer.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//

import UIKit


public class FrameConstraintComposer {
    
    private let view: UIView
    private var modificationConfigs: ConstraintModificationConfig = ConstraintModificationConfig()
    
    init(view: UIView) {
        self.view = view
    }
    
    @MainActor
    public func makeConstraints(_ closure: (_ make: FrameConstraintBuilder) -> Void) {
        
        defer { resetModifierFlags() }
        
        let maker = FrameConstraintBuilder(proxyView: FrameProxy(view: view))
        
        closure(maker)
        
        if modificationConfigs.shouldGenerateConstraints {
            
            for description in maker.descriptions {
                FrameConstraintBuilder.makeConstraints(frameDescription: description)
            }
            
            if modificationConfigs.shouldAnimate {
                UIView.animate(withDuration: modificationConfigs.duration) {
                    self.view.layoutIfNeeded()
                }
            }
            
        }
    }
    
    @MainActor
    public func updateConstraints(_ closure: (_ make: FrameConstraintBuilder) -> Void) {
        
        defer { resetModifierFlags() }
        
        let maker = FrameConstraintBuilder(proxyView: FrameProxy(view: view))
        
        closure(maker)
        
        if modificationConfigs.shouldGenerateConstraints {
            
            for description in maker.descriptions {
                FrameConstraintBuilder.updateConstraints(frameDescription: description)
            }
            
            if modificationConfigs.shouldAnimate {
                UIView.animate(withDuration: modificationConfigs.duration) {
                    self.view.superview?.layoutIfNeeded()
                }
            }
            
        }
    }
    
    @MainActor
    public func removeConstraints(_ closure: (_ make: FrameConstraintBuilder) -> Void) {
        
        defer { resetModifierFlags() }
        
        let maker = FrameConstraintBuilder(proxyView: FrameProxy(view: view))
        
        closure(maker)
        
        if modificationConfigs.shouldGenerateConstraints {
            
            for description in maker.descriptions {
                FrameConstraintBuilder.removeConstraints(frameDescription: description)
            }
            
            if modificationConfigs.shouldAnimate {
                UIView.animate(withDuration: modificationConfigs.duration) {
                    self.view.superview?.layoutIfNeeded()
                }
            }
            
        }

    }
    
    private func resetModifierFlags() {
        self.modificationConfigs = ConstraintModificationConfig()
    }
}

extension FrameConstraintComposer {
    
    @MainActor
    public func applyIf(_ condition: Bool) -> Self {
        
        self.modificationConfigs.shouldGenerateConstraints = condition
        
        return self
    }
    
    @MainActor
    public func debugPrintIf(_ condition: Bool, _ prefix: String = "") -> Self {
        
        self.modificationConfigs.shouldDebugOnConsole = condition
        self.modificationConfigs.debugPrefix = prefix
        
        return self
    }
    
    @MainActor
    public func debugPrintWith(_ prefix: String = "") -> Self {
        
        self.modificationConfigs.shouldDebugOnConsole = true
        self.modificationConfigs.debugPrefix = prefix
        
        return self
    }
    
    public func animateWith(_ duration: TimeInterval) -> Self {
        
        self.modificationConfigs.shouldAnimate = true
        self.modificationConfigs.duration = duration
       
        return self
    }
    
}
