//
//  FrameProxy.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//

import UIKit


/// `FrameProxy` acts as an intermediary to manage layout constraints applied to a specific view.
///
/// This class provides methods to add, store, and manage constraints for a view, enabling the manipulation of constraints without directly
/// affecting the view's primary constraints until desired. It maintains an internal list of constraints applied through the proxy.
internal class FrameProxy: ProxyView {
    
    /// The view associated with this proxy, where constraints will be applied.
    var view: UIView
    
    /// A list of constraints currently managed by this proxy.
    private(set) var constraints: [NSLayoutConstraint] = []
    
    /// Initialises a new `FrameProxy` for the specified view.
    ///
    /// - Parameter view: The UIView instance to which this proxy will apply constraints.
    init(view: UIView) {
        self.view = view
    }
    
    /// Adds a single constraint to the list of managed constraints.
    ///
    /// - Parameter constraint: The NSLayoutConstraint instance to be added to the proxy.
    
    internal func addConstraints(constraint: NSLayoutConstraint) {
        constraints.append(constraint)
        /// Sanitising constraints to remove the redundant ones
        constraints = constraints.removeDuplicateConstraints()
    }
    
    /// Sets multiple constraints at once, appending them to the current list.
    ///
    /// - Parameter constraints: An array of NSLayoutConstraint instances to be added to the proxy.
    internal func set(constraints: [NSLayoutConstraint]) {
        self.constraints.append(contentsOf: constraints)
    }
    
    /// Removes all constraints currently managed by the proxy.
    ///
    /// This function clears the list of constraints, allowing for a fresh set of constraints to be added without any residuals from previous ones.
    internal func removeAllConstraints() {
        constraints.removeAll()
    }
}


