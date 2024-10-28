//
//  ConstraintBuilderModifier.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 25/10/24.
//

import UIKit


@MainActor
public class ConstraintBuilderModifier {
    
    private let requestType: ConstraintModificationRequest
    private var generatedDescriptions: [FrameDescription]
    
    init(requestType: ConstraintModificationRequest, descriptions: [FrameDescription]) {
        self.generatedDescriptions = descriptions
        self.requestType = requestType
    }
    
    public func applyIf(_ condition: Bool) {
        
        if condition {
            startGeneration()
        }
        
    }
    
    public func debugPrintIf(_ condition: Bool = true) {
        
        generatedDescriptions = generatedDescriptions.compactMap({ item in
            let _item = item
            _item.shouldDebugOnConsole = condition
            return _item
        })
        
        startGeneration()
    }
    
    
    public func animate(_ duration: TimeInterval) {
        
        startGeneration()
        
        UIView.animate(withDuration: duration) {
            self.generatedDescriptions.first?.proxyView.view.superview?.layoutIfNeeded()
        }
        
    }
    
    public func animate(_ duration: TimeInterval, delay: TimeInterval, type: UIView.AnimationOptions, completion: @escaping((Bool) -> Void)) {
        
        startGeneration()
        
        UIView.animate(withDuration: duration, delay: delay, options: type) {
            
            self.generatedDescriptions.first?.proxyView.view.superview?.layoutIfNeeded()
            
        } completion: { isCompleted in
            
            completion(isCompleted)
            
        }
        
    }
    
    private func startGeneration() {
    
        generatedDescriptions.forEach { description in
            
            switch requestType {
            case .Make:
                FrameConstraintBuilder.makeConstraints(frameDescription: description)
                break
            case .Update:
                FrameConstraintBuilder.updateConstraints(frameDescription: description)
                break
            case .Remove:
                FrameConstraintBuilder.removeConstraints(frameDescription: description)
                break
            }
            
        }
    }
}
