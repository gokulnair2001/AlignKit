//
//  FrameConstraintComposer.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//

import UIKit


/// `FrameConstraintComposer` is a utility class that facilitates the creation, updating, and removal
/// of layout constraints for a specified view. It manages constraint modifications and provides options
/// for animations and debugging output.
public class FrameConstraintComposer {
    
    private let view: UIView
    private var modificationConfigs: ConstraintModificationConfig = ConstraintModificationConfig()
    
    /// Initializes a new instance of `FrameConstraintComposer` with the specified view.
    /// - Parameter view: The `UIView` for which constraints will be managed.
    init(view: UIView) {
        self.view = view
    }
    
    // MARK: - Constraint Management Methods
    
    /// Creates and applies constraints to the view using a closure that specifies the layout.
    /// - Parameter closure: A closure that takes a `FrameConstraintBuilder` to define constraints.
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
            
        } else {
            debugPrint("ApplyIf condition unmet—constraint generation bypassed".highlightForDebug(.info))
        }
    }
    
    /// Updates existing constraints for the view using a closure that specifies the layout.
    /// - Parameter closure: A closure that takes a `FrameConstraintBuilder` to define constraints.
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
            
        } else {
            debugPrint("ApplyIf condition unmet—constraint generation bypassed".highlightForDebug(.info))
        }
    }
    
    /// Removes constraints from the view using a closure that specifies the layout.
    /// - Parameter closure: A closure that takes a `FrameConstraintBuilder` to define constraints.
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
            
        } else {
            debugPrint("ApplyIf condition unmet—constraint generation bypassed".highlightForDebug(.info))
        }
    }
    
    // MARK: - Private Methods
    
    /// Resets the modification flags in the configuration.
    private func resetModifierFlags() {
        self.modificationConfigs = ConstraintModificationConfig()
    }
}

// MARK: - Extension for Configuration Methods

extension FrameConstraintComposer {
    
    /// Conditionally applies constraints based on the provided condition.
    /// - Parameter condition: A boolean indicating whether to generate constraints.
    /// - Returns: The current instance of `FrameConstraintComposer`.
    @MainActor
    public func applyIf(_ condition: Bool) -> Self {
        self.modificationConfigs.shouldGenerateConstraints = condition
        return self
    }
    
    /// Enables debug printing based on the provided condition.
    /// - Parameters:
    ///   - condition: A boolean indicating whether to debug print to the console.
    ///   - prefix: An optional prefix for debug output.
    /// - Returns: The current instance of `FrameConstraintComposer`.
    @MainActor
    public func debugPrintIf(_ condition: Bool, _ prefix: String = "") -> Self {
        self.modificationConfigs.shouldDebugOnConsole = condition
        self.modificationConfigs.debugPrefix = prefix
        return self
    }
    
    /// Enables debug printing with a specified prefix.
    /// - Parameter prefix: A prefix for debug output.
    /// - Returns: The current instance of `FrameConstraintComposer`.
    @MainActor
    public func debugPrintWith(_ prefix: String = "") -> Self {
        self.modificationConfigs.shouldDebugOnConsole = true
        self.modificationConfigs.debugPrefix = prefix
        return self
    }
    
    /// Configures the duration for animations when constraints are modified.
    /// - Parameter duration: The duration of the animation in seconds.
    /// - Returns: The current instance of `FrameConstraintComposer`.
    public func animateWith(_ duration: TimeInterval) -> Self {
        self.modificationConfigs.shouldAnimate = true
        self.modificationConfigs.duration = duration
        return self
    }
}
